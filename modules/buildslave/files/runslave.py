#!/usr/bin/python

# MOZILLA DEPLOYMENT NOTES
# - This file is distributed to all buildslaves by Puppet, placed at
#   /usr/local/bin/runslave.py on POSIX systems (linux, darwin) and
#   C:\runslave.py on Windows systems
# - It lives in the 'buildslave' puppet module

import sys
import os
import re
import traceback
import subprocess
import textwrap
import urllib2

class RunslaveError(Exception): pass
class NoBasedirError(RunslaveError): pass
class NoBuildbotTacError(RunslaveError): pass

class BuildbotTac:
    def __init__(self, options):
        self.options = options
        self.page = None
        self.basedir = None

    def get_basedir(self):
        """Get the basedir, using (starting with most preferred):
           - cached value (C{self.basedir})
           - C{self.options.basedir}
           - basedir extracted from C{self.page}
           - guess_basedir
        This method either returns a basedir, or raises a NoBasedirError.
        """
        if self.basedir:
            return self.basedir

        if self.options.basedir:
            self.basedir = self.options.basedir
            return self.basedir

        extracted = self.extract_basedir(self.page)
        if extracted:
            self.basedir = extracted
            return self.basedir

        guessed = self.guess_basedir(self.options.slavename)
        if guessed:
            self.basedir = guessed
            return self.basedir

        raise NoBasedirError("Cannot determine basedir for slave %s" % self.options.slavename)

    # When the allocator is up, try to extract the basedir from the resulting
    # .tac file.  Note, however, that it's possible to get tac files which do
    # not contain a basedir, e.g., a disabled slave.  This just returns None
    # in such a case.
    def extract_basedir(self, page):
        if not page:
            return None
        mo = re.search("^basedir\\s*=\\s*([ur]?['\"].*['\"])", page, re.M|re.I)
        if mo:
            basedir_cmd = mo.group(1)
            extracted = eval(basedir_cmd.strip())
            return extracted

    # When the allocator is down, we're on our own to start the buildslave.  The
    # general approach is to try to start the slave at all costs, on the assumption
    # that if we fail then this slave will be detected as hung and will be manually
    # touched. The hard part is remembering where the buildslave's basedir should
    # be.  We can often tell based on the slave name, but barring that we'll just
    # search for a basedir that exists.
    def guess_basedir(self, slavename):
        def slave_matches(*parts):
            "True if any of PARTS appears in options.slavename"
            for part in parts:
                if part in slavename:
                    return True
            return False

        dirs = dict(
            posix_build='/builds/slave',
            windows_build=r'e:\builds\moz2_slave',
            linux_test='/home/cltbld/talos-slave',
            mac_test='/Users/cltbld/talos-slave',
            win_test=r'c:\talos-slave',
        )

        # first try to guess based on the slave name
        basedir = None
        if slave_matches('slave', 'xserve'):
            if slave_matches('linux', 'darwin', 'mac', 'xserve'):
                basedir = dirs['posix_build']
            elif slave_matches('win', 'w32', 'w764', 'w64'):
                basedir = dirs['windows_build']
        elif slave_matches('talos', '-try', 'r3'):
            if slave_matches('linux', 'ubuntu', 'fed'):
                basedir = dirs['linux_test']
            elif slave_matches('tiger', 'leopard', 'snow'):
                basedir = dirs['mac_test']
            elif slave_matches('xp', 'w7'):
                basedir = dirs['win_test']

        # failing that, find a directory that exists
        if not basedir:
            for d in dirs.values():
                if os.path.exists(d):
                    basedir = d
                    break

        if basedir is None:
            print >>sys.stderr, "runslave.py could not guess basedir for %s" % slavename
            sys.exit(1)

        return basedir

    def get_filename(self):
        basedir = self.get_basedir()
        return os.path.join(basedir, "buildbot.tac")

    def download(self):
        url = self.options.allocator_url
        slavename = self.options.slavename
        slavename = slavename.split('.', 1)[0]

        # create a full URL based on the slave name
        full_url = url.replace('SLAVE', slavename)

        try:
            # clear out any cached self.basedir, since we might get a new value
            self.basedir = None

            # download the page
            page_file = urllib2.urlopen(full_url)
            page = self.page = page_file.read()

            # check that it's (likely to be) valid
            if 'AUTOMATICALLY GENERATED - DO NOT MODIFY' not in page:
                print >>sys.stderr, "WARNING: downloaded page did not contain validity-check string"
                return False

            # tuck it away in buildbot.tac
            filename = self.get_filename()
            if self.options.verbose:
                print "writing", filename
            tmpfile = '%s.tmp' % filename
            f = open(tmpfile, "w")
            f.write(page)
            os.rename(tmpfile, filename)
            return True
        except:
            print >>sys.stderr, "WARNING: error while fetching ", full_url
            if self.options.verbose:
                traceback.print_exc()
            # oh noes!  No worries, we'll just use the existing .tac file
            return False

    def run(self):
        if not os.path.exists(self.get_filename()):
            raise NoBuildbotTacError("no buildbot.tac found; cannot start")
        sys.exit(subprocess.call(
            [self.options.twistd_cmd, '--no_save', '--python', self.get_filename()],
            cwd=self.get_basedir()))

default_allocator_url = "http://slavealloc.build.mozilla.org/gettac/SLAVE"
if __name__ == '__main__':
    from optparse import OptionParser
    import socket

    parser = OptionParser(usage=textwrap.dedent("""\
        usage:
            %%prog [--verbose] [--allocator-url URL] [--twistd-cmd CMD]
                        [--basedir BASEDIR] [--slavename SLAVE]
                        [--no-start]

        Attempt to download a .tac file from the allocator, or use a locally cached
        version if an error occurs.  The slave name is used to determine the basedir,
        and is calculated from gethostname() if not given on the command line.

        The slave name, if not specified, is determined via gethostname().

        The basedir, if not specified, and the allocator is not available, then
        the basedir is calculated from the slave name; see the code for
        details.

        The allocator URL defaults to
          %(default_allocator_url)s
        The URL will have the string 'SLAVE' replaced with the unqualified
        slavename.  The resulting page should be the plain-text .tac file to be
        written to disk.  It must contain the string
          AUTOMATICALLY GENERATED - DO NOT MODIFY
        (as a safety check that it's valid).

        Once the .tac file is set up, this invokes 'CMD start BASEDIR'.  CMD is
        from --twistd-cmd, and is calculated based on the slave name if not
        specified.  The twistd is not started if --no-start is provided.
    """ % dict(default_allocator_url=default_allocator_url)))
    parser.add_option("-a", "--allocator-url", action="store", dest="allocator_url")
    parser.add_option("-c", "--twistd-cmd", action="store", dest="twistd_cmd")
    parser.add_option("-d", "--basedir", action="store", dest="basedir")
    parser.add_option("-n", "--slavename", action="store", dest="slavename")
    parser.add_option("-v", "--verbose", action="store_true", dest="verbose")
    parser.add_option(      "--no-start", action="store_true", dest="no_start")
    parser.set_defaults(allocator_url=default_allocator_url)

    (options, args) = parser.parse_args()

    # apply some defaults
    if not options.slavename:
        options.slavename = socket.gethostname().split('.')[0]

    if not options.twistd_cmd:
        # let's just put it here *everywhere*, eh?
        options.twistd_cmd = '/tools/buildbot/bin/twistd'

    # set up the .tac file
    try:
        tac = BuildbotTac(options)
        ok = tac.download()
        if not ok:
            print >>sys.stderr, "WARNING: falling back to existing buildbot.tac"

        if not options.no_start:
            tac.run()
    except RunslaveError, error:
        print >>sys.stderr, "FATAL: %s" % str(error)
