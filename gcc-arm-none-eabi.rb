require 'formula'

class GccArmNoneEabi < Formula
  homepage 'https://launchpad.net/gcc-arm-embedded'
  version '20150925'
  url 'https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-mac.tar.bz2'
  sha256 '3405d998e0b0882d228aa8208e78bd767ec32675'

  def install 
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
