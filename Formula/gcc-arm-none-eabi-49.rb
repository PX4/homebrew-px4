class GccArmNoneEabi49 < Formula
  desc "GNU Embedded Toolchain for ARM"
  homepage "https://launchpad.net/gcc-arm-embedded"
  url "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-mac.tar.bz2"
  version "20150925"
  sha256 "a6353db31face60c2091c2c84c902fc4d566decd1aa04884cd822c383d13c9fa"

  def install
    ohai "Copying binaries..."
    cp_r %w[arm-none-eabi bin lib share], "#{prefix}/"
  end
end
