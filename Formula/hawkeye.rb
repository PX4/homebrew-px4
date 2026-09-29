class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/desktop-v0.5.0/hawkeye-0.5.0.tar.gz"
  sha256 "e92b0c817b2283305e3570b4f4b669cdcb31a4495fceb7c30bb408caeee7d9f7"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/PX4/Hawkeye/releases/download/desktop-v0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3a7350f0e06be6dfaa58c4cdb1ea8b3a474963b9947a73584e59d4bd8ba3274e"
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
