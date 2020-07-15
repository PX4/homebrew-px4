require "formula"

# This depends on Java 11 or 14 installed using e.g. AdoptOpenJDK
# brew tap adoptopenjdk/openjdk
# brew cask install adoptopenjdk14
# Alternatively, Java can be installed from Oracle.

class Px4SimJmavsim < Formula
  desc "PX4 jMAVSim simulation"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/Firmware/master/Tools/px4.py"
  version "1.6.5.0"
  sha256 "dafe6a32d270c48cbd42960adb2155bd5f60d1aec8cb644b10f8cafc0c8d2e8f"
  depends_on "ant"
  depends_on "px4-dev"

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/px4-sim-jmavsim.py"
    ohai "PX4 jMAVSim simulation installed"
  end
end
