require 'formula'

class GccArmNoneEabi48 < Formula
  homepage 'https://launchpad.net/gcc-arm-embdded'
  version '20131218'
  url 'https://launchpadlibrarian.net/162333029/gcc-arm-none-eabi-4_8-2013q4-20131218-mac.tar.bz2'
  sha1 '57c33bef0f7b098929e6d95f3be164e5929915d5'

  def install 
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
