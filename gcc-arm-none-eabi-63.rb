require 'formula'

class GccArmNoneEabi63 < Formula
  homepage 'https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads'
  version '20170628'
  url 'https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-mac.tar.bz2?revision=ef567310-404c-48e2-8b67-12e3c86f584a?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Mac%20OS%20X,6-2017-q2-update'
  sha256 '7d3080514a2899d05fc55466cdc477e2448b6a62f536ffca3dd846822ff52900'

  def install
    ohai 'Copying binaries...'
    system 'cp', '-r', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
