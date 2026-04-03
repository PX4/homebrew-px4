class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/v0.2.0/hawkeye-0.2.0.tar.gz"
  sha256 "97c99405bd927126c3b3ef7b91b97ef654ae29f0a81125150c5d266622a358ca"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/PX4/Hawkeye/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2cb3d473fc86ac1cb3bf89d86207d714f4f173d67cdb370a59b4db3917f5ed24"
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
