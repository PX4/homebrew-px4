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
	depends_on :java

	homepage 'http://px4.io'
	version '1.6.0.1'
	url 'https://raw.githubusercontent.com/PX4/Firmware/master/Tools/px4'
	sha256 '48199ee9ff392eff8a1efcd177e2c10f4a4dfd9877e52e13b1f3540d5dfedac9'

	resource "pyserial" do
		url "https://files.pythonhosted.org/packages/df/c9/d9da7fafaf2a2b323d20eee050503ab08237c16b0119c7bbf1597d53f793/pyserial-2.7.tar.gz"
		sha256 "3542ec0838793e61d6224e27ff05e8ce4ba5a5c5cc4ec5c6a3e8d49247985477"
	end
	resource "EmPy" do
		url "https://files.pythonhosted.org/packages/b7/56/72a285d257c7791616960493a04f14c05ca1bf7a83dd208485cf991563bd/empy-3.3.2.tar.gz"
		sha256 "99f016af2770c48ab57a65df7aae251360dc69a1514c15851458a71d4ddfea9c"
	end
	resource "Jinja2" do
		url "https://files.pythonhosted.org/packages/f2/2f/0b98b06a345a761bec91a079ccae392d282690c2d8272e708f4d10829e22/Jinja2-2.8.tar.gz"
		sha256 "bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4"
	end
	resource "MarkupSafe" do
		url "https://files.pythonhosted.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz"
		sha256 "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"
	end

	def install
		system 'mkdir', '-p', "#{prefix}/bin/"
		system 'cp', 'px4', "#{prefix}/bin/"
		resource("pyserial").stage { system "python", *Language::Python.setup_install_args('libexec/"vendor"') }
		resource("EmPy").stage { system "python", *Language::Python.setup_install_args('libexec/"vendor"') }
		resource("Jinja2").stage { system "python", *Language::Python.setup_install_args('libexec/"vendor"') }
		resource("MarkupSafe").stage { system "python", *Language::Python.setup_install_args('libexec/"vendor"') }
		ohai 'PX4 Toolchain Installed'
	end
end