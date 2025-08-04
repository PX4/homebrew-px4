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
  depends_on "genromfs"
  depends_on "kconfig-frontends"
  depends_on "ncurses"
  depends_on "ninja"
  depends_on "osx-cross/arm/arm-gcc-bin@13"
  depends_on "python"
  depends_on "python-tk"

  def install
    # Patch px4.py to use HTTPS for remote tag lookup instead of SSH
    inreplace "px4.py",
              "git@github.com:PX4/PX4-Autopilot.git",
              "https://github.com/PX4/PX4-Autopilot.git"

    # Install the px4 script
    bin.install "px4.py"
    ohai "PX4 Toolchain Installed"
  end

  def caveats
    <<~EOS
      The PX4 development toolchain has been installed, including the ARM cross-compiler
      from the osx-cross/arm tap (arm-gcc-bin@13).

      Homebrew does not link versioned formulae by default, so you must link the compiler manually

          brew link --overwrite --force arm-gcc-bin@13

      If you have other versions of arm-none-eabi-gcc installed, this may override them.
      You can unlink it manually with:

          brew unlink arm-gcc-bin@13
    EOS
  end

  test do
    # Ensure the script runs without SSH errors and prints release info
    output = shell_output("#{bin}/px4.py")
    assert_match(/PX4 Release/, output)
  end
end
