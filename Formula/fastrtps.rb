require "formula"

class Fastrtps < Formula
  desc "OMG RTPS / DDS implementation."
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "http://px4-tools.s3.amazonaws.com/fastrtps-v1.6.0.tar.gz"
  version "1.6.0"
  sha256 "a999f30e945c2be856cc4cbed3b338646c4016e6a26e0416dc442f07f658a2b5"

  bottle do
    root_url "http://px4-tools.s3.amazonaws.com"
    cellar :any
    sha256 "c3de7e9fde7eb59dbc30e398ea7332c083a664667eacfcb9898370c256384c4f" => :high_sierra
    sha256 "c3de7e9fde7eb59dbc30e398ea7332c083a664667eacfcb9898370c256384c4f" => :mojave
  end

  depends_on "cmake" => :build
  depends_on "gradle" => :build
  depends_on :java

  def install
    Dir.mkdir("./build")
    Dir.chdir("./build")
    system "cmake", "-DTHIRDPARTY=ON", "-DBUILD_JAVA=ON", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}", ".."
    system "make"
    system "make", "install"
  end
end
