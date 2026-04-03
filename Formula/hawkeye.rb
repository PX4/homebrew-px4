class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/v0.2.0/hawkeye-0.2.0.tar.gz"
  sha256 "234d5ae1c8a9eed48ed98e092bd6caa8c135cc41cbc5860792a25cca445e638e"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/PX4/Hawkeye/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "12859249d0618f4c87fe85b23be8b00e07a1740301cd6c3edc6dd7afa8d3626b"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DHOMEBREW_ALLOW_FETCHCONTENT=ON",
           *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build", "--prefix", prefix
  end

  test do
    assert_predicate bin/"hawkeye", :executable?
  end
end
