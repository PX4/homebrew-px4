require 'formula'

class GccArmNoneEabi49 < Formula
  homepage 'https://launchpad.net/gcc-arm-embedded'
  version '20150925'
  url 'https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-mac.tar.bz2'
  sha256 'a6353db31face60c2091c2c84c902fc4d566decd1aa04884cd822c383d13c9fa'

  def install
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
