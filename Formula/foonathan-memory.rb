class FoonathanMemory < Formula
  desc "STL-compatible C++ allocator library with a simpler memory model"
  homepage "https://memory.foonathan.net"
  url "https://github.com/foonathan/memory/archive/refs/tags/v0.7-1.tar.gz"
  sha256 "19eb61c5cba6ccc40b8ee741350fd29402a46641ba752c30b7079528d87dbc79"
  license "Zlib"

  depends_on "cmake" => :build

  def install
    # Use out-of-tree build directory to avoid nested chdir conflicts
    build_dir = buildpath/"build"
    build_dir.mkpath

    # Configure with tests disabled and CMake compatibility policy
    system "cmake", "-S", ".", "-B", build_dir,
           "-DFOONATHAN_MEMORY_BUILD_TESTS=OFF",
           "-DCMAKE_POLICY_VERSION_MINIMUM=3.5",
           *std_cmake_args

    # Build and install
    system "cmake", "--build", build_dir
    system "cmake", "--install", build_dir
  end
end
