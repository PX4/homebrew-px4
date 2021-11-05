class Fastddsgen < Formula
  desc "Fast-DDS IDL code generator tool "
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-dds"
  url "https://github.com/eProsima/Fast-DDS-Gen.git", tag: "v1.0.4"
  sha256 "a75399160aab20490a64a4e936230f446441a2717c756e478bbd83822fcb97a2"
  license "Apache-2.0"

  depends_on "gradle" => :build
  depends_on "fastdds"
  depends_on "openjdk@11"

  def install
    system "./gradlew", "assemble"
    system "./gradlew", "install", "--install_path=#{prefix}"
  end

end
