class Fastdds < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
  url "https://github.com/eProsima/Fast-DDS/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "d8c87e84c41a5628cc41658476137b6a392f218b844a6f5e2ff5d8c359fd5b10"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "asio@1.10.8"
  depends_on "fastcdr"
  depends_on "foonathan-memory"
  depends_on "tinyxml2"

  def install
    # Out-of-tree build to avoid nested chdir conflicts
    build_dir = buildpath/"build"
    build_dir.mkpath

    # Configure, build, and install with updated CMake policy
    system "cmake", "-S", ".", "-B", build_dir,
           "-DCMAKE_POLICY_VERSION_MINIMUM=3.5",
           *std_cmake_args
    system "cmake", "--build", build_dir
    system "cmake", "--install", build_dir
  end
end
