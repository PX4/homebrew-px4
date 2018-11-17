require 'formula'

class GccArmNoneEabi48 < Formula
  homepage 'https://launchpad.net/gcc-arm-embedded'
  version '20140805'
  url 'http://launchpadlibrarian.net/186124092/gcc-arm-none-eabi-4_8-2014q3-20140805-mac.tar.bz2'
  sha256 '6b30901738b09a8d22fdfff99e991217444b80ac492a6163af5c06a3baaa3487'

  def install 
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
