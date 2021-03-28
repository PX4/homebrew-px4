# This formula is presented for compatiliby with older instructions.
# Going forward Gazebo and/or jMAVSim can also be installed individually using
# px4-sim-gazebo and px4-sim-jmavsim.

class Px4Sim < Formula
  desc "PX4 simulation toolchain"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/PX4-Autopilot/master/Tools/px4.py"
  version "1.11.0"
  sha256 "6e4a8a6aad592a0c156d16233e16ee276fd6cc63b620be5bd047375b1352e27d"
  depends_on "px4-sim-gazebo"
  depends_on "px4-sim-jmavsim"

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/px4-sim.py"
    ohai "PX4 Simulation Installed"
  end
end
