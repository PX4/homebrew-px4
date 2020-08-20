require "formula"

class Px4Dev < Formula
  desc "PX4 development toolchain"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/Firmware/master/Tools/px4.py"
  version "1.6.5.0"
  sha256 "dafe6a32d270c48cbd42960adb2155bd5f60d1aec8cb644b10f8cafc0c8d2e8f"
  depends_on "ant"
  depends_on "astyle"
  depends_on "bash-completion"
  depends_on "ccache"
  depends_on "cmake"
  depends_on "fastcdr"
  depends_on "fastrtps"
  depends_on "discoteq/discoteq/flock"
  depends_on "gcc-arm-none-eabi"
  depends_on "genromfs"
  depends_on "kconfig-frontends"
  depends_on "ninja"
  depends_on "python"

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/"
    ohai "PX4 Toolchain Installed"
  end
end
