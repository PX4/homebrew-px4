class Fastcdr < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://github.com/eProsima/Fast-CDR/archive/refs/tags/v1.0.22.tar.gz"
  sha256 "7ca7f09c633963622431bdb216eeb4145e378f81a2ce5113e341b9eee55e4f44"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/PX4/homebrew-px4/releases/download/bottles"
    sha256 cellar: :any, arm64_sequoia: "95309e80fc84222007c57cb274d90dc0ba16fc436dd68d0139d9ed4fcc2fc541"
  end

  depends_on "cmake" => :build

  def install
    ENV.cxx11

    build_dir = buildpath/"build"
    build_dir.mkpath

    args = std_cmake_args + %W[
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
      #include <fastcdr/FastCdr.h>
      int main() { return 0; }
    CPP
    system ENV.cxx, "t.cpp", "-std=c++14", "-L#{lib}", "-lfastcdr", "-I#{include}"
  end
end
