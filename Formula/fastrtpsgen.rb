require "formula"

class Fastrtpsgen < Formula
  desc "A built-in code generation tool which eases the process of translating an IDL specification of a data type to a working implementation of the methods needed to create topics, used by publishers and subscribers, of that data type."
  homepage "https://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
  url "https://px4-tools.s3.amazonaws.com/Fast-RTPS-Gen-1.0.2.tar.xz"
  sha256 "fd2d5b2746e0164b6293c6b15e56239d9ddf4984174def3aedb231668c93d4a1"
  depends_on "gradle" => :build
  depends_on :java

  def install
    Dir.mkdir("./build")
    Dir.chdir("./build")
    system "gradle", "assemble"
    Dir.mkdir("./usr/local/share/fastrtps/")
    system "cp", "share/fastrtpsgen/java/fastrtpsgen.jar" "/usr/local/share/fastrtps/"
    system "cp", "scripts/fastrtpsgen" "/usr/local/bin/"
  end
end
