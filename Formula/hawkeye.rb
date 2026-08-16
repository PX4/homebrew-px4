class Hawkeye < Formula
  desc "Real-time 3D flight visualizer for PX4 with ULog replay and multi-drone analysis"
  homepage "https://github.com/PX4/Hawkeye"
  url "https://github.com/PX4/Hawkeye/releases/download/v0.4.0-rc2/hawkeye-0.4.0-rc2.tar.gz"
  sha256 "1c9814e3adc76c4094191d6699f8801747eb4ef709a10b67a6a8fcc02610860d"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/PX4/Hawkeye/releases/download/v0.4.0-rc2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b4aa70721853866b47d60abb17876254862733c9a04978ca1f700bbbdf8ccf30"
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
