class Fastrtps15 < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "http://px4-tools.s3.amazonaws.com/fastrtps-v1.5.0p.tar.gz"
  version "1.5.0"
  sha256 "c1e807bb05fe23929525731c9a85d26a23f3a132ffce29c905c37d0fd2d37805"

  bottle do
    root_url "http://px4-tools.s3.amazonaws.com"
    sha256 cellar: :any, el_capitan:  "e33d048df94b0e4efcdc5249a979f6c3780607d96ef1a1f767c54ab425a4418a"
    sha256 cellar: :any, sierra:      "e33d048df94b0e4efcdc5249a979f6c3780607d96ef1a1f767c54ab425a4418a"
    sha256 cellar: :any, high_sierra: "e33d048df94b0e4efcdc5249a979f6c3780607d96ef1a1f767c54ab425a4418a"
    sha256 cellar: :any, mojave:      "e33d048df94b0e4efcdc5249a979f6c3780607d96ef1a1f767c54ab425a4418a"
  end

  depends_on "cmake" => :build
  depends_on "gradle" => :build
  depends_on "openjdk"

  patch :p0, 'diff --git CMakeLists.txt CMakeLists.txt
index ee7fc73b..eed6f0b4 100644
--- CMakeLists.txt
+++ CMakeLists.txt
@@ -373,10 +373,10 @@ install(FILES ${PROJECT_SOURCE_DIR}/LICENSE
 set(CPACK_COMPONENT_LICENSES_HIDDEN 1)

 # Install examples
-install(DIRECTORY ${PROJECT_SOURCE_DIR}/examples/C++
-    DESTINATION examples/
-    COMPONENT examples
-    )
+#install(DIRECTORY ${PROJECT_SOURCE_DIR}/examples/C++
+#    DESTINATION examples/
+#    COMPONENT examples
+#    )

 set(CPACK_COMPONENT_EXAMPLES_DISPLAY_NAME "Examples")
 set(CPACK_COMPONENT_EXAMPLES_DESCRIPTION "eProsima ${PROJECT_NAME_LARGE} examples")'

  def install
    Dir.mkdir("./build")
    Dir.chdir("./build")
    system "cmake", "-DTHIRDPARTY=ON", "-DBUILD_JAVA=ON", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}", ".."
    system "make"
    system "make", "install"
  end
end
