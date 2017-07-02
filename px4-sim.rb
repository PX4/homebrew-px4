require 'formula'

class Px4Sim < Formula
	depends_on "px4-dev"
	depends_on :x11
	depends_on "graphviz"
	depends_on "protobuf"
	depends_on "homebrew/science/opencv"
	depends_on "osrf/simulation/gazebo8"

	homepage 'http://px4.io'
	version '1.6.0.1'
	url 'https://raw.githubusercontent.com/PX4/Firmware/master/Tools/px4'
	sha256 '48199ee9ff392eff8a1efcd177e2c10f4a4dfd9877e52e13b1f3540d5dfedac9'

	def install
		system 'mkdir', '-p', "#{prefix}/bin/"
		system 'cp', 'px4', "#{prefix}/bin/px4-sim"
		ohai 'PX4 Simulation Installed'
	end
end