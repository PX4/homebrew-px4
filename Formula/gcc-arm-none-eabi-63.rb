class GccArmNoneEabi63 < Formula
  desc "GNU Embedded Toolchain for ARM"
  homepage "https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads"
  url "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-mac.tar.bz2"
  version "20170628"
  sha256 "7d3080514a2899d05fc55466cdc477e2448b6a62f536ffca3dd846822ff52900"

  def install
    ohai "Copying binaries..."
    cp_r %w[arm-none-eabi bin lib share], "#{prefix}/"
  end
end
