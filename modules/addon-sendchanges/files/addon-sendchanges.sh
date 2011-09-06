#!/bin/bash
#forces sendchanges to test mozilla-central builds for all platforms
# usage 
# sendchange -p <port> -r -a <addon file> -m <master>
# author: Alice Nodelman <anodelman@mozilla.com>
if [ $# -eq 0 ] ; then
  echo "Usage: $0 -p <port> -r -a <addon file> -m <master>"
  exit 1
fi
RELEASE_TEST=false
ADDONFILE='no_addon_file'
MASTER='localhost'
while [ $# -gt 0 ] ; do
  case $1 in
    -r) RELEASE_TEST=true ; shift 1 ;;
    -p) PORT=$2 ; shift 2 ;;
    -a) ADDONFILE=$2 ; shift 2 ;;
    -m) MASTER=$2 ; shift 2 ;;
    *) shift 1 ;;
  esac
done

#collect info 
BUILDURL="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central/"
MOBILEURL="http://ftp.mozilla.org/pub/mobile/nightly/latest-mozilla-central-android-r7/"
RELEASEURL="http://releases.mozilla.org/pub/mozilla.org/firefox/releases/latest"
TYPE="talos" #opt-unittest, debug-unittest
WIN32=$(wget -O - $BUILDURL 2> /dev/null | grep -m1 -o '"firefox-[^"]*win32.zip"' | perl -pi -e 's/"//g')
WIN64=$(wget -O - $BUILDURL 2> /dev/null | grep -m1 -o '"firefox-[^"]*win64-x86_64.zip"' | perl -pi -e 's/"//g')
LINUX=$(wget -O - $BUILDURL 2> /dev/null | grep -m1 -o '"firefox-[^"]*linux-i686.tar.bz2"' | perl -pi -e 's/"//g')
LINUX64=$(wget -O - $BUILDURL 2> /dev/null | grep -m1 -o '"firefox-[^"]*linux-x86_64.tar.bz2"' | perl -pi -e 's/"//g')
MACOSX=$(wget -O - $BUILDURL 2> /dev/null | grep -m1 -o '"firefox-[^"]*mac.dmg"' | perl -pi -e 's/"//g') #no more 32 bit mac builds
MOBILE=$(wget -O - $MOBILEURL 2> /dev/null | grep -m1 -o '>fennec-[^<]*.apk' | perl -pi -e 's/>//g')
MACOSX64=$(wget -O - $BUILDURL 2> /dev/null | grep -m1 -o '"firefox-[^"]*mac.dmg"' | perl -pi -e 's/"//g')
WIN32_RELEASE=$(wget -O - $RELEASEURL/win32/en-US/ 2> /dev/null | grep -m1 -o '"Firefox[^"]*.exe"' | perl -pi -e 's/"//g')
WIN64_RELEASE=$(wget -O - $RELEASEURL/win32/en-US/ 2> /dev/null | grep -m1 -o '"Firefox[^"]*.exe"' | perl -pi -e 's/"//g')
LINUX_RELEASE=$(wget -O - $RELEASEURL/linux-i686/en-US/ 2> /dev/null | grep -m1 -o '"firefox[^"]*.tar.bz2"' | perl -pi -e 's/"//g')
#LINUX64_RELEASE=$(wget -O - $RELEASEURL 2> /dev/null | grep -m1 -o '"firefox-[^"]*linux-x86_64.tar.bz2"' | perl -pi -e 's/"//g')
MACOSX_RELEASE=$(wget -O - $RELEASEURL/mac/en-US/ 2> /dev/null | grep -m1 -o '"Firefox[^"]*.dmg"' | perl -pi -e 's/"//g') #no more 32 bit mac builds
MACOSX64_RELEASE=$(wget -O - $RELEASEURL/mac/en-US/ 2> /dev/null | grep -m1 -o '"Firefox[^"]*.dmg"' | perl -pi -e 's/"//g')

if [ -e $ADDONFILE ];  then
  #going to trigger addon tests
  while read line ;do
    array=($line)
    ADDONURL=${array[0]}
    if (! $RELEASE_TEST) ; then
      #nightly moz-central builds
      #echo "sending nightly builds to addontester branch for testing $ADDONURL"
      USERNAME="addons_sendchange_script"
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-macosx-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $BUILDURL$MACOSX >/dev/null
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-macosx64-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $BUILDURL$MACOSX64 >/dev/null
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-win32-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $BUILDURL$WIN32 >/dev/null
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-win64-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $BUILDURL$WIN64 >/dev/null
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-linux-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $BUILDURL$LINUX >/dev/null
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-linux64-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $BUILDURL$LINUX64 >/dev/null
    else
      #release builds
      #echo "sending latest release builds to addontester branch for testing $ADDONURL"
      USERNAME="addons_sendchange_script_releasebuilds"
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-macosx-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $RELEASEURL/mac/en-US/$MACOSX_RELEASE >/dev/null
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-macosx64-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $RELEASEURL/mac/en-US/$MACOSX64_RELEASE >/dev/null
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-win32-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $RELEASEURL/win32/en-US/$WIN32_RELEASE >/dev/null
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-win64-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $RELEASEURL/win32/en-US/$WIN64_RELEASE >/dev/null
      buildbot sendchange --master=$MASTER:$PORT --branch=addontester-linux-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $RELEASEURL/linux-i686/en-US/$LINUX_RELEASE >/dev/null
      #buildbot sendchange --master=$MASTER:$PORT --branch=addontester-linux64-$TYPE --username=$USERNAME  --property addonUrl:$ADDONURL $RELEASEURL$LINUX64_RELEASE >/dev/null
    fi
  done < $ADDONFILE
  #send a baseline result through the system for comparison
  if (! $RELEASE_TEST) ; then
    #nightly moz-central builds
    #echo "sending nightly builds to addonbaselinetester branch"
    USERNAME="addons_sendchange_script"
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-macosx-$TYPE --username=$USERNAME $BUILDURL$MACOSX >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-macosx64-$TYPE --username=$USERNAME $BUILDURL$MACOSX64 >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-win32-$TYPE --username=$USERNAME $BUILDURL$WIN32 >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-win64-$TYPE --username=$USERNAME $BUILDURL$WIN64 >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-linux-$TYPE --username=$USERNAME $BUILDURL$LINUX >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-linux64-$TYPE --username=$USERNAME $BUILDURL$LINUX64 >/dev/null
  else
    #release builds
    #echo "sending latest release builds to addonbaselinetester"
    USERNAME="addons_sendchange_script_releasebuilds"
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-macosx-$TYPE --username=$USERNAME $RELEASEURL/mac/en-US/$MACOSX_RELEASE >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-macosx64-$TYPE --username=$USERNAME $RELEASEURL/mac/en-US/$MACOSX64_RELEASE >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-win32-$TYPE --username=$USERNAME $RELEASEURL/win32/en-US/$WIN32_RELEASE >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-win64-$TYPE --username=$USERNAME $RELEASEURL/win32/en-US/$WIN64_RELEASE >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-linux-$TYPE --username=$USERNAME $RELEASEURL/linux-i686/en-US/$LINUX_RELEASE >/dev/null
    #buildbot sendchange --master=$MASTER:$PORT --branch=addonbaselinetester-linux64-$TYPE --username=$USERNAME $RELEASEURL$LINUX64_RELEASE >/dev/null
  fi
else
  if (! $RELEASE_TEST) ; then
    #nightly moz-central builds
    #echo 'sending nightly builds to mozilla-central branch for testing'
    USERNAME="sendchange_script"
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-macosx-$TYPE --username=$USERNAME $BUILDURL$MACOSX >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-macosx64-$TYPE --username=$USERNAME $BUILDURL$MACOSX64 >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-win32-$TYPE --username=$USERNAME $BUILDURL$WIN32 >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-win64-$TYPE --username=$USERNAME $BUILDURL$WIN64 >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-linux-$TYPE --username=$USERNAME $BUILDURL$LINUX >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-linux64-$TYPE --username=$USERNAME $BUILDURL$LINUX64 >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-android-$TYPE --username=$USERNAME $MOBILEURL$MOBILE >/dev/null
  else
    #release builds
    #echo 'sending latest release builds to mozilla-central branch for testing'
    USERNAME="sendchange_script_releasebuilds"
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-macosx-$TYPE --username=$USERNAME $RELEASEURL/mac/en-US/$MACOSX_RELEASE >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-macosx64-$TYPE --username=$USERNAME $RELEASEURL/mac/en-US/$MACOSX64_RELEASE >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-win32-$TYPE --username=$USERNAME $RELEASEURL/win32/en-US/$WIN32_RELEASE >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-win64-$TYPE --username=$USERNAME $RELEASEURL/win32/en-US/$WIN64_RELEASE >/dev/null
    buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-linux-$TYPE --username=$USERNAME $RELEASEURL/linux-i686/en-US/$LINUX_RELEASE >/dev/null
    #buildbot sendchange --master=$MASTER:$PORT --branch=mozilla-central-linux64-$TYPE --username=$USERNAME $RELEASEURL$LINUX64_RELEASE >/dev/null
  fi
fi
