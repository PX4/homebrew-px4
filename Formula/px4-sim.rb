require "formula"

# This formula is presented for compatiliby with older instructions.
# Going forward Gazebo and/or jMAVSim can also be installed individually using
# px4-sim-gazebo and px4-sim-jmavsim.

class Px4Sim < Formula
  desc "PX4 simulation toolchain"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/Firmware/master/Tools/px4.py"
  version "1.6.5.0"
  sha256 "dafe6a32d270c48cbd42960adb2155bd5f60d1aec8cb644b10f8cafc0c8d2e8f"
  depends_on "px4-sim-gazebo"
  depends_on "px4-sim-jmavsim"

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/px4-sim.py"
    ohai "PX4 Simulation Installed"
  end
end
