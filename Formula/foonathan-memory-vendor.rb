require "formula"

class FoonathanMemoryVendor < Formula
  desc "Vendor package for foonathan/memory: https://github.com/foonathan/memory."
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://px4-tools.s3.amazonaws.com/foonathan_memory_vendor-0.3.0.tar.xz"
  sha256 "1dc0bbe3f012e09fde6e5d775646ffe88d3073bb1cce198fec36bfe8a62ef39c"

  bottle do
    root_url "https://px4-tools.s3.amazonaws.com"
    cellar :any
    sha256 "1dc0bbe3f012e09fde6e5d775646ffe88d3073bb1cce198fec36bfe8a62ef39c" => :high_sierra
    sha256 "1dc0bbe3f012e09fde6e5d775646ffe88d3073bb1cce198fec36bfe8a62ef39c" => :mojave
    sha256 "1dc0bbe3f012e09fde6e5d775646ffe88d3073bb1cce198fec36bfe8a62ef39c" => :catalina
  end

  depends_on "cmake" => :build

  def install
    Dir.mkdir("./build")
    Dir.chdir("./build")
    system "cmake", "-DCMAKE_INSTALL_PREFIX=PATH=#{prefix}", "-DBUILD_SHARED_LIBS=ON", ".."
    system "make"
    system "make", "install"
    # The bellow is required in the case that foonathan_memory is already installed
    system "touch", "dummy"
    bin.install "dummy"
  end
end
