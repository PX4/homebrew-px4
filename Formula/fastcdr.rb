require "formula"

class Fastcdr < Formula
  desc "eProsima FastCDR library provides two serialization mechanisms. One is the standard CDR serialization mechanism, while the other is a faster implementation of it."
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://px4-tools.s3.amazonaws.com/Fast-CDR-1.0.10.tar.xz"
  sha256 "914e019ba06dc0eca147d35d3bef3c660fed6b79aa86c22ec14a27ea098fffb2"
  depends_on "cmake" => :build

  def install
    # Install FastCDR
    Dir.mkdir("./build")
    Dir.chdir("./build")
    system "cmake", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}", ".."
    system "make"
    system "make", "install"
  end
end
