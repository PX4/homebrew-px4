class Fastdds < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
  url "https://github.com/eProsima/Fast-DDS/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "d8c87e84c41a5628cc41658476137b6a392f218b844a6f5e2ff5d8c359fd5b10"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/PX4/homebrew-px4/releases/download/bottles"
    sha256 cellar: :any, arm64_sequoia: "41f0cc0089a369b396f1f3c51231fbc0e5ac330d6b51d10a40c39c267ec5d718"
  end

  depends_on "cmake" => :build
  depends_on "asio@1.10.8"
  depends_on "fastcdr"
  depends_on "foonathan-memory"
  depends_on "tinyxml2"

  def install
    ENV.cxx11

    build_dir = buildpath/"build"
    build_dir.mkpath

    args = std_cmake_args + %W[
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
      -DCMAKE_CXX_STANDARD=14
      -DCMAKE_CXX_STANDARD_REQUIRED=ON
      -DCMAKE_CXX_EXTENSIONS=OFF
      -DFASTDDS_BUILD_TESTS=OFF
      -DFASTDDS_EXAMPLES=OFF
      -DFASTDDS_TOOLS=OFF
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
    # Header presence test
    assert_path_exist include/"fastrtps/fastrtps_fwd.h"
  end
end
