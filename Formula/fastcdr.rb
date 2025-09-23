class Fastcdr < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://github.com/eProsima/Fast-CDR/archive/refs/tags/v1.0.22.tar.gz"
  sha256 "7ca7f09c633963622431bdb216eeb4145e378f81a2ce5113e341b9eee55e4f44"

  depends_on "cmake" => :build

  def install
    ENV.cxx11

    sdk = Utils.popen_read("xcrun --sdk macosx --show-sdk-path").chomp
    libcxx = "#{sdk}/usr/include/c++/v1"

    build_dir = buildpath/"build"
    build_dir.mkpath

    std_args = std_cmake_args + %W[
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
      -DCMAKE_OSX_ARCHITECTURES=x86_64
      -DCMAKE_OSX_SYSROOT=#{sdk}
      -DCMAKE_CXX_STANDARD=14
      -DCMAKE_CXX_EXTENSIONS=OFF
    ]

    # Make absolutely sure the compiler sees the SDK + libc++ headers
    ENV["SDKROOT"] = sdk
    ENV.append "CPPFLAGS", "-isysroot #{sdk} -I#{libcxx}"
    ENV.append "CXXFLAGS", "-isysroot #{sdk} -I#{libcxx} -stdlib=libc++"
    ENV.append "LDFLAGS",  "-isysroot #{sdk} -stdlib=libc++"

    system "cmake", "-S", ".", "-B", build_dir, *std_args
    system "cmake", "--build", build_dir
    system "cmake", "--install", build_dir
  end
end
