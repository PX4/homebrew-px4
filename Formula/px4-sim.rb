# This formula is presented for compatiliby with older instructions.
# Going forward Gazebo and/or jMAVSim can also be installed individually using
# px4-sim-gazebo and px4-sim-jmavsim.

class Px4Sim < Formula
  desc "PX4 simulation toolchain"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/PX4-Autopilot/master/Tools/px4.py"
  version "1.11.0"
  sha256 "7fc8a739658212cea302f446ef31c60babb5928ce98c9d990617f039e0da9ada"
  depends_on "px4-sim-gazebo"
  depends_on "px4-sim-jmavsim"

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/px4-sim.py"
    ohai "PX4 Simulation Installed"
  end
end
