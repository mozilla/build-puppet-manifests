import os
import runslave
import unittest
import textwrap
import urllib2
import StringIO
import shutil
import tempfile

# to run these tests:
#  - change into this directory
#  - run 'trial test_runslave.py' (or whatever test-runner you prefer)

class BuildbotTac(unittest.TestCase):

    def setUp(self):
        self.old_urlopen = urllib2.urlopen
        self.old_os_path_exists = os.path.exists
        self.basedir = tempfile.mkdtemp('-test_runslave', dir=os.path.abspath('.'))
        if os.path.exists(self.basedir):
            shutil.rmtree(self.basedir)
        os.makedirs(self.basedir)

    def tearDown(self):
        urllib2.urlopen = self.old_urlopen
        os.path.exists = self.old_os_path_exists
        if os.path.exists(self.basedir):
            shutil.rmtree(self.basedir)

    def patch_urlopen(self, exp_url, result=None, raise_exc=False):
        def urlopen(url):
            self.assertEqual(url, exp_url)
            if raise_exc:
                raise RuntimeError("couldn't fetch that page, sry")
            return StringIO.StringIO(result)
        urllib2.urlopen = urlopen

    def patch_os_path_exists(self, *existing_paths):
        def exists(path):
            return path in existing_paths
        os.path.exists = exists

    def make_options(self, basedir=None, slavename='random-slave13'):
        class Options: pass
        options = Options()
        options.basedir = basedir
        options.slavename = slavename
        options.allocator_url = 'http://allocator/SLAVE'
        options.verbose = False
        return options

    # get_basedir tests

    def test_get_basedir_options(self):
        # options are preferred
        bt = runslave.BuildbotTac(self.make_options(basedir='/given/basedir'))
        bt.extract_basedir = lambda page : '/extracted/basedir'
        bt.guess_basedir = lambda slavename : '/guessed/basedir'
        self.assertEqual(bt.get_basedir(), '/given/basedir')

    def test_get_basedir_extract(self):
        # extraction is used if the basedir option is not set
        bt = runslave.BuildbotTac(self.make_options())
        bt.extract_basedir = lambda page : '/extracted/basedir'
        bt.guess_basedir = lambda slavename : '/guessed/basedir'
        self.assertEqual(bt.get_basedir(), '/extracted/basedir')

    def test_get_basedir_guess(self):
        # if there are no options and extraction fails, use a guess
        bt = runslave.BuildbotTac(self.make_options())
        bt.extract_basedir = lambda page : None
        bt.guess_basedir = lambda slavename : '/guessed/basedir'
        self.assertEqual(bt.get_basedir(), '/guessed/basedir')

    def test_get_basedir_cached(self):
        # if there are no options and extraction fails, use a guess
        bt = runslave.BuildbotTac(self.make_options())
        bt.extract_basedir = lambda page : None
        bt.guess_basedir = lambda slavename : '/guessed/basedir'
        self.assertEqual(bt.get_basedir(), '/guessed/basedir')
        bt.guess_basedir = lambda slavename : 'SHOULD NOT BE CALLED'
        self.assertEqual(bt.get_basedir(), '/guessed/basedir')

    def test_get_basedir_failure(self):
        # and if we completely strike out, raise an exception
        bt = runslave.BuildbotTac(self.make_options())
        bt.extract_basedir = lambda page : None
        bt.guess_basedir = lambda slavename : None
        self.assertRaises(runslave.NoBasedirError, lambda : bt.get_basedir())

    # extract_basedir tests

    def test_extract_basedir_unicode(self):
        tacfile = textwrap.dedent("""\
            # AUTOMATICALLY GENERATED - DO NOT MODIFY
            # generated: Tue Feb  8 16:32:01 2011 on euclid.r.igoro.us
            from twisted.application import service
            from buildbot.slave.bot import BuildSlave
            from twisted.python.logfile import LogFile
            from twisted.python.log import ILogObserver, FileLogObserver

            maxdelay = 300
            buildmaster_host = None
            passwd = None
            maxRotatedFiles = None
            basedir = u'/builds/slave'
            umask = 002
            slavename = 'linux-ix-slave01'
            usepty = 1
            rotateLength = 1000000
            port = None
            keepalive = None

            application = service.Application('buildslave')
            logfile = LogFile.fromFullPath("twistd.log", rotateLength=rotateLength,
                                        maxRotatedFiles=maxRotatedFiles)
            application.setComponent(ILogObserver, FileLogObserver(logfile).emit)
            s = BuildSlave(buildmaster_host, port, slavename, passwd, basedir,
                        keepalive, usepty, umask=umask, maxdelay=maxdelay)
            s.setServiceParent(application)""")
        bt = runslave.BuildbotTac(self.make_options())
        self.assertEqual(bt.extract_basedir(tacfile), '/builds/slave')

    def test_extract_basedir_plain(self):
        tacfile = textwrap.dedent("""\
            keepalive = None
            basedir = '/builds/slave'
            s.setServiceParent(application)""")
        bt = runslave.BuildbotTac(self.make_options())
        self.assertEqual(bt.extract_basedir(tacfile), '/builds/slave')

    def test_extract_basedir_tabs(self):
        tacfile = textwrap.dedent("""\
            keepalive = None
            basedir	=	'/builds/slave'
            s.setServiceParent(application)""")
        bt = runslave.BuildbotTac(self.make_options())
        self.assertEqual(bt.extract_basedir(tacfile), '/builds/slave')

    def test_extract_basedir_dblquote(self):
        tacfile = textwrap.dedent("""\
            keepalive = None
            basedir = "/builds/slave"
            s.setServiceParent(application)""")
        bt = runslave.BuildbotTac(self.make_options())
        self.assertEqual(bt.extract_basedir(tacfile), '/builds/slave')

    def test_extract_basedir_double_backslash(self):
        tacfile = textwrap.dedent("""\
            keepalive = None
            basedir = "c:\\\\talos-slave"
            s.setServiceParent(application)""")
        bt = runslave.BuildbotTac(self.make_options())
        self.assertEqual(bt.extract_basedir(tacfile), r'c:\talos-slave')

    def test_extract_basedir_raw(self):
        tacfile = textwrap.dedent("""\
            keepalive = None
            basedir = r'c:\\talos-slave'
            s.setServiceParent(application)""")
        bt = runslave.BuildbotTac(self.make_options())
        self.assertEqual(bt.extract_basedir(tacfile), r'c:\talos-slave')

    # guess_basedir tests

    known_hostname = {
        'bm-xserveNN' : '/builds/slave',
        'linux-ix-slaveNN' : '/builds/slave',
        'linux64-ix-slaveNN' : '/builds/slave',
        'moz2-darwin10-slaveNN' : '/builds/slave',
        'moz2-darwin9-slaveNN' : '/builds/slave',
        'moz2-linux-slaveNN' : '/builds/slave',
        'moz2-linux64-slaveNN' : '/builds/slave',
        'moz2-win32-slaveNN' : 'e:\\builds\\moz2_slave',
        'mv-moz2-linux-ix-slaveNN' : '/builds/slave',
        'mw32-ix-slaveNN' : 'e:\\builds\\moz2_slave',
        'mw64-ix-slaveNN' : 'e:\\builds\\moz2_slave',
        't-r3-w764-NN' : 'c:\\talos-slave',
        'talos-r3-fed-NN' : '/home/cltbld/talos-slave',
        'talos-r3-fed64-NN' : '/home/cltbld/talos-slave',
        'talos-r3-leopard-NN' : '/Users/cltbld/talos-slave',
        'talos-r3-snow-NN' : '/Users/cltbld/talos-slave',
        'talos-r3-w7-NN' : 'c:\\talos-slave',
        'talos-r3-xp-NN' : 'c:\\talos-slave',
        'try-linux-slaveNN' : '/builds/slave',
        'try-linux64-slaveNN' : '/builds/slave',
        'try-mac-slaveNN' : '/builds/slave',
        'try-mac64-slaveNN' : '/builds/slave',
        'try-w32-slaveNN' : 'e:\\builds\\moz2_slave',
        'w32-ix-slaveNN' : 'e:\\builds\\moz2_slave',
        'w64-ix-slaveNN' : 'e:\\builds\\moz2_slave',
        }
    known_basedirs = set(known_hostname.values())

    def test_guess_basedir_known_hostnames(self):
        bt = runslave.BuildbotTac(self.make_options())
        for hostname, basedir in self.known_hostname.iteritems():
            self.assertEqual(bt.guess_basedir(hostname), basedir)

    def test_guess_basedir_known_basedirs(self):
        bt = runslave.BuildbotTac(self.make_options())
        for basedir in self.known_basedirs:
            self.patch_os_path_exists(basedir)
            # pass a bogus hostname, so it falls back to os.path.exists
            self.assertEqual(bt.guess_basedir('randombox'), basedir,
                    "guess for %s" % basedir)

    # download tests

    def test_download_exception(self):
        bt = runslave.BuildbotTac(self.make_options(slavename='slave13'))
        self.patch_urlopen('http://allocator/slave13', raise_exc=True)
        self.assertFalse(bt.download())

    def test_download_bad_result(self):
        bt = runslave.BuildbotTac(self.make_options(slavename='slave13'))
        self.patch_urlopen('http://allocator/slave13', "this is not a tac")
        self.assertFalse(bt.download())

    def test_download_good_result_extract_basedir(self):
        bt = runslave.BuildbotTac(self.make_options(slavename='slave13'))
        bt.get_basedir = lambda : self.basedir
        self.patch_urlopen('http://allocator/slave13',
                textwrap.dedent("""\
                    # AUTOMATICALLY GENERATED - DO NOT MODIFY
                    basedir = %r """ % self.basedir))
        self.assertTrue(bt.download())
        self.assertTrue(os.path.exists(os.path.join(self.basedir, 'buildbot.tac')))

