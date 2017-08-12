require 'formula'

class Fastcdr < Formula
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  version "1.6.0"
  desc "OMG RTPS / DDS implementation."
  url "https://github.com/eProsima/Fast-CDR/archive/v1.0.6.tar.gz"
  sha256 "ce9ee04a7b242721df3a0af98e6ae4f8afe9d536e7d59405322e03a6d251d471"

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
