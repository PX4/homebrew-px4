require 'formula'

class GccArmNoneEabi47 < Formula
  homepage 'https://launchpad.net/gcc-arm-embedded'
  version '20140408'
  url 'http://launchpadlibrarian.net/174121504/gcc-arm-none-eabi-4_7-2014q2-20140408-mac.tar.bz2'
  sha256 'b2ed364a0be3eeda86a5eaeaff529b8189ef6afebe62802663af782537deb857'

  def install 
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
