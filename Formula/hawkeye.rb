class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/v1.0.0/hawkeye-1.0.0.tar.gz"
  sha256 "08c646622efcc32e042b0e73dc959bd19a51cd8d39c24f0630c4c62ca01d4465"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/PX4/Hawkeye/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "21ae52aa96cc9b20c58b9ea4b33c99c2accf6aef33dbc1bd4a77ef7fcded671f"
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
