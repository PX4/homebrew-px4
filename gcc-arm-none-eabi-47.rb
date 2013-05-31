require 'formula'

class GccArmNoneEabi47 < Formula
  homepage 'https://launchpad.net/gcc-arm-embdded'
  version '20130313'
  url 'https://launchpadlibrarian.net/135590305/gcc-arm-none-eabi-4_7-2013q1-20130313-mac.tar.bz2'
  sha1 '97ef3b02ef277c03c956add1bea9ecb80a3e3ad2'

  def install 
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
