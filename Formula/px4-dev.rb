require "formula"

class Px4Dev < Formula
  desc "PX4 development toolchain"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/Firmware/master/Tools/px4.py"
  version "1.6.5.0"
  sha256 "48199ee9ff392eff8a1efcd177e2c10f4a4dfd9877e52e13b1f3540d5dfedac9"
  depends_on "ant"
  depends_on "astyle"
  depends_on "bash-completion"
  depends_on "cmake"
  depends_on "fastcdr"
  depends_on "fastrtps"
  depends_on "gcc-arm-none-eabi"
  depends_on "genromfs"
  depends_on :java
  depends_on "kconfig-frontends"
  depends_on "ninja"
  depends_on "python"

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/"
    ohai "PX4 Toolchain Installed"
  end
end
