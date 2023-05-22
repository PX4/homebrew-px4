class FoonathanMemory < Formula
  desc "STL compatible C++ memory allocator library using a new RawAllocator concept that is similar to an Allocator but easier to use and write."
  homepage "https://memory.foonathan.net"
  url "https://github.com/foonathan/memory/archive/refs/tags/v0.7-1.tar.gz"
  sha256 "19eb61c5cba6ccc40b8ee741350fd29402a46641ba752c30b7079528d87dbc79"
  license "Zlib"

  depends_on "cmake" => :build

  def install
    Dir.mkdir("./build")
    Dir.chdir("./build")
    system "cmake", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}", ".."
    system "make"
    system "make", "install"
  end

end
