class Fastdds < Formula
  desc "OMG RTPS / DDS implementation"
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
  url "https://github.com/eProsima/Fast-DDS/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "d8c87e84c41a5628cc41658476137b6a392f218b844a6f5e2ff5d8c359fd5b10"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "asio"
  depends_on "tinyxml2"
  depends_on "fastcdr"
  depends_on "foonathan-memory"

  # Patch to use io_context instead of deprecated io_service
  patch :DATA

  def install
    # Use out-of-tree build to avoid nested Dir.chdir conflicts
    build_dir = buildpath/"build"
    build_dir.mkpath

    system "cmake", "-S", ".", "-B", build_dir,
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DCMAKE_POLICY_VERSION_MINIMUM=3.5",
           *std_cmake_args
    system "cmake", "--build", build_dir
    system "cmake", "--install", build_dir
  end
end

__END__
diff --git a/src/cpp/rtps/flowcontrol/FlowController.h b/src/cpp/rtps/flowcontrol/FlowController.h
index abcdef0..1234567 100644
--- a/src/cpp/rtps/flowcontrol/FlowController.h
+++ b/src/cpp/rtps/flowcontrol/FlowController.h
@@ -73,7 +73,7 @@ class FastDDSFlowController
-  static std::unique_ptr<asio::io_service> ControllerService;
+  static std::unique_ptr<asio::io_context> ControllerService;
