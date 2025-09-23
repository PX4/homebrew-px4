class AsioAT1108 < Formula
  desc "Cross-platform C++ Library for asynchronous programming"
  homepage "https://think-async.com/Asio"
  url "https://downloads.sourceforge.net/project/asio/asio/1.10.8%20%28Stable%29/asio-1.10.8.tar.bz2"
  sha256 "26deedaebbed062141786db8cfce54e77f06588374d08cccf11c02de1da1ed49"
  license "BSL-1.0"
  head "https://github.com/chriskohlhoff/asio.git"
  keg_only :versioned_formula

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "boost@1.85"

  def install
    ENV.cxx11

    boost = Formula["boost@1.85"]

    # Discover the macOS SDK path (needed for standard C++ headers on modern macOS)
    sdk = Utils.popen_read("xcrun --sdk macosx --show-sdk-path").chomp
    libcxx = "#{sdk}/usr/include/c++/v1"

    # Regenerate the configure script
    system "autoconf"

    # Configure with explicit Boost prefix; pass flags *inline* so configure can't ignore them
    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --with-boost=#{boost.opt_prefix}
    ]

    cppflags = "-I#{boost.opt_include} -I#{libcxx} -isysroot #{sdk}"
    cxxflags = "-std=c++11 -I#{boost.opt_include} -I#{libcxx} -isysroot #{sdk}"
    ldflags  = "-L#{boost.opt_lib} -isysroot #{sdk}"

    system "./configure",
          *args,
          "CPPFLAGS=#{cppflags}",
          "CXXFLAGS=#{cxxflags}",
          "LDFLAGS=#{ldflags}",
          # Preseed the old Autoconf header check we hit earlier:
          "ac_cv_header_boost_noncopyable_hpp=yes"

    system "make", "install"
    pkgshare.install "src/examples"
  end


  test do
    # Use the HTTP server example to verify functionality
    httpserver = pkgshare/"examples/cpp03/http/server/http_server"
    pid = fork do
      exec httpserver, "127.0.0.1", "8080", "."
    end
    sleep 1
    begin
      assert_match "404 Not Found", shell_output("curl -s http://127.0.0.1:8080")
    ensure
      Process.kill "TERM", pid
      Process.wait pid
    end
  end
end
