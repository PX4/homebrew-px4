require "formula"

class Px4SimJmavsim < Formula
  desc "PX4 jMAVSim simulation"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/Firmware/master/Tools/px4.py"
  version "1.6.5.0"
  sha256 "48199ee9ff392eff8a1efcd177e2c10f4a4dfd9877e52e13b1f3540d5dfedac9"
  depends_on "ant"
  depends_on :adoptopenjdk8

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/px4-sim.py"
    ohai "PX4 jMAVSim simulation installed"
  end
end
