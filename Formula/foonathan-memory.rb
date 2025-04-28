class FoonathanMemory < Formula
  desc "STL compatible C++ memory allocator library using a new memory model similar to an Allocator but easier to use and write."
  homepage "https://memory.foonathan.net"
  url "https://github.com/foonathan/memory/archive/refs/tags/v0.7-1.tar.gz"
  sha256 "19eb61c5cba6ccc40b8ee741350fd29402a46641ba752c30b7079528d87dbc79"
  license "Zlib"

  depends_on "cmake" => :build

  def install
    # Use out-of-tree build directory to avoid nested chdir conflicts
    build_dir = buildpath/"build"
    build_dir.mkpath

    # Configure with CMake policy minimum to satisfy compatibility
    system "cmake", "-S", ".", "-B", build_dir,
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DCMAKE_POLICY_VERSION_MINIMUM=3.5",
           *std_cmake_args

    # Build and install
    system "cmake", "--build", build_dir
    system "cmake", "--install", build_dir
  end
end