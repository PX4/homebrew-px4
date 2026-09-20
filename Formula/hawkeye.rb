class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/v1.0.0/hawkeye-1.0.0.tar.gz"
  sha256 "309ec1c5d545531d8ec5e532b5842862c6620f0d3235f1ce7315fd20a259db29"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/PX4/Hawkeye/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "0999f42fb318889b4987a6a225407fd6b7babdc406b793af3337d54a02af3b5f"
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
