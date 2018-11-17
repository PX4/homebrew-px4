require 'formula'

class Px4Dev < Formula
	depends_on "git"
	depends_on "bash-completion"
	depends_on "gcc-arm-none-eabi"
	depends_on "genromfs"
	depends_on "kconfig-frontends"
	depends_on "astyle"
	depends_on "cmake"
	depends_on "ninja"
	depends_on "ant"
	depends_on "fastrtps"
	depends_on "fastcdr"
	depends_on :java

	homepage 'http://px4.io'
	version '1.6.5.0'
	url 'https://raw.githubusercontent.com/PX4/Firmware/master/Tools/px4.py'
	sha256 '48199ee9ff392eff8a1efcd177e2c10f4a4dfd9877e52e13b1f3540d5dfedac9'

	def install
		system 'mkdir', '-p', "#{prefix}/bin/"
		system 'cp', 'px4.py', "#{prefix}/bin/"
		ohai 'PX4 Toolchain Installed'
	end
end