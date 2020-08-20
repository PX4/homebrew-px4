class Fastcdr < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://github.com/eProsima/Fast-CDR/archive/v1.0.8.tar.gz"
  version "1.6.0"
  sha256 "d47d924b76bc2fc7821dcadda4f8d1cb0f56df8353aa57cdf1106c49a612507f"

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
