class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/v0.2.0/hawkeye-0.2.0.tar.gz"
  sha256 "1d17afc8889ea33f577a21c0fc51dbf372da1c304132dbb54d07b71bb78b4f75"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/PX4/Hawkeye/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "98d303ebdf1390aa17896bacfa47b08a91618e7372140e392b58dc1c3e0f0386"
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
