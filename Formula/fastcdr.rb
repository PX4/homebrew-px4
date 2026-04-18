class Fastcdr < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://github.com/eProsima/Fast-CDR/archive/refs/tags/v1.0.22.tar.gz"
  sha256 "7ca7f09c633963622431bdb216eeb4145e378f81a2ce5113e341b9eee55e4f44"

  bottle do
    root_url "https://github.com/PX4/homebrew-px4/releases/download/bottles"
    sha256 cellar: :any, arm64_sequoia: "95309e80fc84222007c57cb274d90dc0ba16fc436dd68d0139d9ed4fcc2fc541"
  end

  depends_on "cmake" => :build

  def install
    build_dir = buildpath/"build"
    build_dir.mkpath

    # Configure with updated minimum CMake policy to avoid compatibility errors
    system "cmake", "-S", ".", "-B", build_dir,
           "-DCMAKE_POLICY_VERSION_MINIMUM=3.5",
           *std_cmake_args
    system "cmake", "--build", build_dir
    system "cmake", "--install", build_dir
  end
end
