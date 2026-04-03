class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/v0.2.0/hawkeye-0.2.0.tar.gz"
  sha256 "c2ea9a3a597a86f7a74c76c90bdb44f3ef460410913d5d7299916452ca2c2bd1"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/PX4/Hawkeye/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a5d583368ad2faf5e50c90ed4ac13e2f033c9132271ec46818e2b9123c547323"
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
