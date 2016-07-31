require 'formula'

class GccArmNoneEabi54 < Formula
  homepage 'https://launchpad.net/gcc-arm-embedded'
  version '20160628'
  url 'https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q2-update/+download/gcc-arm-none-eabi-5_4-2016q2-20160622-mac.tar.bz2'
  sha256 'e175a0eb7ee312013d9078a5031a14bf14dff82c7e697549f04b22e6084264c8'

  def install 
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
