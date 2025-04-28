class OgreAT19 < Formula
  desc "Scene-oriented 3D engine written in C++ (OGRE 1.9 branch)"
  homepage "https://www.ogre3d.org/"
  url "https://osrf-distributions.s3.amazonaws.com/ogre/releases/sinbad-ogre-108ab0bcc696.tar.bz2"
  version "1.9-20160714-108ab0bcc69603dba32c0ffd4bbbc39051f421c9"
  sha256 "3ca667b959905b290d782d7f0808e35d075c85db809d3239018e4e10e89b1721"
  license "MIT"
  keg_only :versioned_formula

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost"
  depends_on "doxygen"
  depends_on "freeimage"
  depends_on "freetype"
  depends_on "libx11"
  depends_on "libzzip"
  depends_on "tbb"

  def install
    # Use out-of-tree build and enforce CMake >= 3.5 policy
    build_dir = buildpath/"build"
    build_dir.mkpath

    args = std_cmake_args + [
      "-DCMAKE_POLICY_VERSION_MINIMUM=3.5",
      "-DOGRE_BUILD_DOCS=OFF",
      "-DOGRE_BUILD_SAMPLES=OFF"
    ]

    system "cmake", "-S", ".", "-B", build_dir, *args
    system "cmake", "--build", build_dir
    system "cmake", "--install", build_dir
  end

  test do
    # Verify the OGRE XML converter runs (basic smoke test)
    (testpath/"test.mesh.xml").write <<~EOS
      <mesh>
        <submeshes>
          <submesh material="" usesharedvertices="false">...</submesh>
        </submeshes>
      </mesh>
    EOS
    system bin/"OgreXMLConverter", "test.mesh.xml"
    assert_predicate testpath/"test.mesh", :exist?
  end
end
