require 'formula'

class GccArmNoneEabi < Formula
  homepage 'https://launchpad.net/gcc-arm-embdded'
  version '20140408'
  url 'http://launchpadlibrarian.net/174121504/gcc-arm-none-eabi-4_7-2014q2-20140408-mac.tar.bz2'
  sha1 'b67dea731c155f9789d88edfbc8764530ffc8c7f'

  def install 
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
