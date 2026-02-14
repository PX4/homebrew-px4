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
    system "autoconf"

    boost = Formula["boost@1.85"]

    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --with-boost=#{boost.opt_prefix}
    ]

    if OS.mac?
      sdk    = Utils.popen_read("xcrun --sdk macosx --show-sdk-path").chomp
      libcxx = "#{sdk}/usr/include/c++/v1"

      # Old configure checks: make headers/libs & SDK unmissable
      cppflags = "-I#{boost.opt_include} -I#{libcxx} -isysroot #{sdk}"
      cxxflags = "-std=c++11 -I#{boost.opt_include} -I#{libcxx} -isysroot #{sdk}"
      ldflags  = "-L#{boost.opt_lib} -isysroot #{sdk} -stdlib=libc++"

      system "./configure",
             *args,
             "CPPFLAGS=#{cppflags}",
             "CXXFLAGS=#{cxxflags}",
             "LDFLAGS=#{ldflags}",
             # Preseed brittle header probe (safe on macOS; a no-op elsewhere)
             "ac_cv_header_boost_noncopyable_hpp=yes"
    else
      system "./configure", *args
    end

    system "make", "install"
    pkgshare.install "src/examples"
  end

  test do
    # Smoke test: header presence
    assert_path_exist include/"asio.hpp"
  end
end
