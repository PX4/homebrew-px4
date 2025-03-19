class XRequirement < Requirement
  fatal true

  satisfy(build_env: false) { which("xquartz") }

  def message
    <<~EOS
      XQuartz is required; install it via:
        brew install --cask xquartz
    EOS
  end
end

class Px4SimGazebo < Formula
  desc "PX4 Gazebo Simulation Toolkit"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/PX4-Autopilot/master/main/px4.py"
  version "1.15.0"
  sha256 "6e4a8a6aad592a0c156d16233e16ee276fd6cc63b620be5bd047375b1352e27d"
  depends_on "exiftool"
  depends_on "glog"
  depends_on "graphviz"
  depends_on "gstreamer"
  depends_on "opencv"
  depends_on "osrf/simulation/gz-harmonic"
  depends_on "protobuf"
  depends_on "px4-dev"

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/px4-sim-gazebo.py"
    ohai "PX4 Gazebo Simulation Installed"
  end

  test do
    output = shell_output("#{bin}/gz sim --version 2> /dev/null")
    assert_match "Gazebo Sim, version 8*", output
  end
end
