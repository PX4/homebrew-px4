class AsioAT1108 < Formula
  desc "Cross-platform C++ Library for asynchronous programming"
  homepage "https://think-async.com/Asio"
  url "https://downloads.sourceforge.net/project/asio/asio/1.10.8%20%28Stable%29/asio-1.10.8.tar.bz2"
  sha256 "26deedaebbed062141786db8cfce54e77f06588374d08cccf11c02de1da1ed49"
  head "https://github.com/chriskohlhoff/asio.git"
  license "BSL-1.0"
  keg_only :versioned_formula

  def install
    # Install metadata files like LICENSE and README
    prefix.install_metafiles

    # Install headers
    (include/"asio").install Dir["asio/include/asio/*.hpp"]
    (include/"asio").install Dir["asio/include/asio/*/*.hpp"]

    # Install examples
    pkgshare.install Dir["asio/examples"]
  end

  test do
    # Use the simple HTTP server example to test functionality
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
