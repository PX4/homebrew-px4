class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/v0.2.0/hawkeye-0.2.0.tar.gz"
  sha256 "99f408229cd2e497ab2b23007e82c50f8551fb91aae63b2ee4ffbd6fa6b818aa"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/PX4/Hawkeye/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ed33fc1f55d3c51021f21a7c4b3515026ce81ca514862a48c53050e53846566f"
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
