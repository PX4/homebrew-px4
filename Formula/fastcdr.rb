class Fastcdr < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://github.com/eProsima/Fast-CDR/archive/v1.0.22.tar.gz"
  sha256 "7ca7f09c633963622431bdb216eeb4145e378f81a2ce5113e341b9eee55e4f44"

  depends_on "cmake" => :build

  # bottle do
  #   root_url "http://px4-tools.s3.amazonaws.com"
  #   cellar :any
  #   sha256 "e33d048df94b0e4efcdc5249a979f6c3780607d96ef1a1f767c54ab425a4418a" => :sierra
  # end

  def install
    Dir.mkdir("./build")
    Dir.chdir("./build")
    system "cmake", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}", ".."
    system "make"
    system "make", "install"
  end
end
