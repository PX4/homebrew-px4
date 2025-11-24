class AbseilAT20250127 < Formula
  desc "C++ Common Libraries (Last LTS version with C++14 support)"
  homepage "https://abseil.io"
  url "https://github.com/abseil/abseil-cpp/archive/refs/tags/20250127.0.tar.gz"
  sha256 "dcf71b9cba8dc0ca9940c4b316a0c796be8fab42b070bb6b7cab62b48f0e66c4"
  license "Apache-2.0"

  keg_only :versioned_formula

  depends_on "cmake" => :build

  def install
    # Abseil requires C++14 for this version
    # Build as static libraries
    system "cmake", "-S", ".", "-B", "build",
                    "-DCMAKE_CXX_STANDARD=14",
                    "-DBUILD_SHARED_LIBS=OFF",
                    "-DCMAKE_INSTALL_RPATH=#{rpath}",
                    *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath/"test.cc").write <<~EOS
      #include <iostream>
      #include "absl/strings/str_format.h"
      int main() {
        std::cout << absl::StrFormat("%s %s!", "Hello", "world");
        return 0;
      }
    EOS
    system ENV.cxx, "-std=c++14", "-I#{include}", "-L#{lib}", "-labsl_str_format_internal",
           "-labsl_strings", "-labsl_strings_internal", "-labsl_base", "-labsl_spinlock_wait",
           "-labsl_int128", "-labsl_throw_delegate", "-labsl_raw_logging_internal",
           "-labsl_log_severity", "test.cc", "-o", "test"
    assert_equal "Hello world!", shell_output("./test")
  end
end
