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
    # Ensure C++11 compatibility
    ENV.cxx11

    # Regenerate the configure script
    system "autoconf"

    # Configure with Boost support
    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --with-boost=#{Formula["boost"].opt_include}
    ]
    system "./configure", *args

    # Build and install
    system "make", "install"

    # Install example programs
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
