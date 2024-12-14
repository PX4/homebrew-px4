class Px4SimGazeboHarmonic < Formula
  desc "PX4 Gazebo Harmonic simulation"
  homepage "http://px4.io"
  url "https://raw.githubusercontent.com/PX4/PX4-Autopilot/main/Tools/px4.py"
  version "1.15.0"
  sha256 "6e4a8a6aad592a0c156d16233e16ee276fd6cc63b620be5bd047375b1352e27d"
  depends_on "exiftool"
  depends_on "glog"
  depends_on "graphviz"
  depends_on "gst-libav"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-base"
  depends_on "gst-plugins-good"
  depends_on "gst-plugins-ugly"
  depends_on "gstreamer"
  depends_on "opencv"
  depends_on "osrf/simulation/gz-harmonic"
  depends_on "protobuf"
  depends_on "px4-dev"

  def install
    mkdir_p "#{bin}/"
    cp "px4.py", "#{bin}/px4-sim-gazebo-harmonic.py"
    ohai "PX4 Gazebo Harmonic simulation installed"
  end
end