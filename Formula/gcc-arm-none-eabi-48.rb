class GccArmNoneEabi48 < Formula
  desc "GNU Embedded Toolchain for ARM"
  homepage "https://launchpad.net/gcc-arm-embedded"
  url "http://launchpadlibrarian.net/186124092/gcc-arm-none-eabi-4_8-2014q3-20140805-mac.tar.bz2"
  version "20140805"
  sha256 "6b30901738b09a8d22fdfff99e991217444b80ac492a6163af5c06a3baaa3487"

  def install
    ohai "Copying binaries..."
    cp_r %w[arm-none-eabi bin lib share], "#{prefix}/"
  end
end
