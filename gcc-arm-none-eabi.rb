require 'formula'

class GccArmNoneEabi < Formula
  homepage 'https://launchpad.net/gcc-arm-embdded'
  version '20130313'
  url 'https://launchpadlibrarian.net/151487551/gcc-arm-none-eabi-4_7-2013q3-20130916-mac.tar.bz2'
  sha1 'a29eda3d4351bfe47749a242f6faa7cbd630d28b'

  def install 
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
