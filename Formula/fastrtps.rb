require "formula"

class Fastrtps < Formula
  desc "eProsima Fast RTPS is a high performance publish subscribe framework to share data in distributed systems using a decoupled model based on Publishers, Subscribers and Data Topics."
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://px4-tools.s3.amazonaws.com/Fast-RTPS-1.9.3.tar.xz"
  sha256 "4583737a2086ff525ab750e0e8f838528cd3f8dfe50c834e429ce26b53d9fb0b"
  depends_on "foonathan-memory-vendor"
  depends_on "asio"
  depends_on "fastcdr"
  depends_on "tinyxml2"
  depends_on "cmake" => :build

  def install
    Dir.mkdir("./build")
    Dir.chdir("./build")
    system "cmake", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}", ".."
    system "cmake", "--build", ".", "--target", "install"
  end
end
