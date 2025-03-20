class Fastdds < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
  url "https://github.com/eProsima/Fast-DDS/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "d8c87e84c41a5628cc41658476137b6a392f218b844a6f5e2ff5d8c359fd5b10"

  depends_on "cmake" => :build
  depends_on "asio"
  depends_on "tinyxml2"
  depends_on "fastcdr"
  depends_on "foonathan-memory"

  def install
    mkdir "build"
    cd "build"
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", ".."
    system "make"
    system "make", "install"
  end

  test do
    # Add a basic test - perhaps check if a library file exists
    # or run a simple command provided by the software
    assert_predicate lib/"libfastrtps.dylib", :exist?
  end
end