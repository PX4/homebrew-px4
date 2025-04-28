class Px4Dev < Formula
  desc "PX4 development toolchain"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/PX4-Autopilot/main/Tools/px4.py"
  version "1.15.0"
  sha256 "5eda2111dc20c092dc8241768121cf4173edabb593b2b199e6c233b5088c52aa"

  depends_on "ant"
  depends_on "astyle"
  depends_on "bash-completion"
  depends_on "ccache"
  depends_on "cmake"
  depends_on "discoteq/discoteq/flock"
  depends_on "fastdds"
  depends_on "gcc-arm-none-eabi"
  depends_on "genromfs"
  depends_on "kconfig-frontends"
  depends_on "ninja"
  depends_on "python"

  def install
    bin.install "px4.py"
    ohai "PX4 Toolchain Installed"
  end

  test do
    # Verify that invoking without args prints release info
    output = shell_output("#{bin}/px4.py")
    assert_match(/PX4 Release/, output)
  end
end
