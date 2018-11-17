require "formula"

class Px4Sim < Formula
  desc "PX4 simulation toolchain"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/Firmware/master/Tools/px4.py"
  version "1.6.5.0"
  sha256 "48199ee9ff392eff8a1efcd177e2c10f4a4dfd9877e52e13b1f3540d5dfedac9"
  depends_on "exiftool"
  depends_on "graphviz"
  depends_on "opencv"
  depends_on "osrf/simulation/gazebo8"
  depends_on "protobuf"
  depends_on "px4-dev"
  depends_on :x11

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/px4-sim.py"
    ohai "PX4 Simulation Installed"
  end
end
