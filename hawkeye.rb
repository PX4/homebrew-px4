class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/v0.1.0/hawkeye-0.1.0.tar.gz"
  sha256 "PLACEHOLDER"
  license "BSD-3-Clause"

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
