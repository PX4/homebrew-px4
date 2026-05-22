class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/v0.3.0/hawkeye-0.3.0.tar.gz"
  sha256 "ef9cb426256a5fb669ccaec6c6062b9dd86deb100142c231e0ecd52893958775"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/PX4/Hawkeye/releases/download/v0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "059768a3856bcf1e3db829ed4c46bd4e7ecd5dcafad17e31b21bbdf27f8d8f63"
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
