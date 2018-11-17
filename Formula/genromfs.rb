require 'formula'

class Genromfs < Formula
  homepage ''
  url 'http://px4-travis.s3.amazonaws.com/toolchain/genromfs-0.5.2.tar.gz'
  sha256 '30f37fc734572c1dbaa2504585bc23ba6b8fd7df767ae7155995b2ca0ebed960'

  def install
    system "make"
    system "make PREFIX=#{prefix} install-bin"
  end

  patch :DATA

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test genromfs`.
    system "false"
  end
end

__END__
diff --git a/Makefile b/Makefile
index d278efc..f0b9427 100644
--- a/Makefile
+++ b/Makefile
@@ -16,7 +16,7 @@ FILES = COPYING NEWS ChangeLog Makefile \
  readme-kernel-patch genrommkdev romfs.txt \
  checkdist

-prefix = /usr
+prefix =
 bindir = $(prefix)/bin
 mandir = $(prefix)/man
