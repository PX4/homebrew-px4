require "formula"

# This depends on AdoptOpenJdk 8 installed using:
# brew tap adoptopenjdk/openjdk
# brew cask install adoptopenjdk8

class Px4SimJmavsim < Formula
  desc "PX4 jMAVSim simulation"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/Firmware/master/Tools/px4.py"
  version "1.6.5.0"
  sha256 "48199ee9ff392eff8a1efcd177e2c10f4a4dfd9877e52e13b1f3540d5dfedac9"
  depends_on "ant"

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/px4-sim-jmavsim.py"
    ohai "PX4 jMAVSim simulation installed"
  end
end
