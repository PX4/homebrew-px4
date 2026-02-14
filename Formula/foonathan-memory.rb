class FoonathanMemory < Formula
  desc "STL-compatible C++ allocator library with a simpler memory model"
  homepage "https://memory.foonathan.net"
  url "https://github.com/foonathan/memory/archive/refs/tags/v0.7-1.tar.gz"
  sha256 "19eb61c5cba6ccc40b8ee741350fd29402a46641ba752c30b7079528d87dbc79"
  license "Zlib"

  depends_on "cmake" => :build

  def install
    ENV.cxx11

    build_dir = buildpath/"build"
    build_dir.mkpath

    args = std_cmake_args + %W[
      -DFOONATHAN_MEMORY_BUILD_TESTS=OFF
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
      -DCMAKE_CXX_STANDARD=14
      -DCMAKE_CXX_STANDARD_REQUIRED=ON
      -DCMAKE_CXX_EXTENSIONS=OFF
    ]

    if OS.mac?
      sdk    = Utils.popen_read("xcrun --sdk macosx --show-sdk-path").chomp
      libcxx = "#{sdk}/usr/include/c++/v1"

      args += %W[
        -DCMAKE_OSX_ARCHITECTURES=x86_64
        -DCMAKE_OSX_SYSROOT=#{sdk}
        -DCMAKE_CXX_FLAGS=-stdlib=libc++\ -isysroot\ #{sdk}\ -I#{libcxx}
        -DCMAKE_EXE_LINKER_FLAGS=-stdlib=libc++\ -isysroot\ #{sdk}
        -DCMAKE_SHARED_LINKER_FLAGS=-stdlib=libc++\ -isysroot\ #{sdk}
      ]
    end

    system "cmake", "-S", ".", "-B", build_dir, *args
    system "cmake", "--build", build_dir
    system "cmake", "--install", build_dir
  end

  test do
    (testpath/"t.cpp").write <<~CPP
      #include <memory>
      int main() { auto p = std::make_unique<int>(42); return *p == 42 ? 0 : 1; }
    CPP
    system ENV.cxx, "t.cpp", "-std=c++14"
  end
end
