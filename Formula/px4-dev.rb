class Px4Dev < Formula
  desc "PX4 development toolchain"
  homepage "https://px4.io"
  url "https://raw.githubusercontent.com/PX4/PX4-Autopilot/main/Tools/px4.py"
  version "1.16.0"
  sha256 "7fc8a739658212cea302f446ef31c60babb5928ce98c9d990617f039e0da9ada"

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
    # Patch px4.py to use HTTPS for remote tag lookup instead of SSH
    inreplace "px4.py",
              "git@github.com:PX4/PX4-Autopilot.git",
              "https://github.com/PX4/PX4-Autopilot.git"

    # Install the px4 script
    bin.install "px4.py"
    ohai "PX4 Toolchain Installed"
  end

  test do
    # Ensure the script runs without SSH errors and prints release info
    output = shell_output("#{bin}/px4.py")
    assert_match(/PX4 Release/, output)
  end
end
