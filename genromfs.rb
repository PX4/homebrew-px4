require 'formula'

class Genromfs < Formula
  homepage ''
  url 'http://voxel.dl.sourceforge.net/project/romfs/genromfs/0.5.2/genromfs-0.5.2.tar.gz'
  sha1 '27615b9de3a020084065b88b3ec74232ef268cf8'

  def install
    system "make"
    system "make PREFIX=#{prefix} install-bin"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test genromfs`.
    system "false"
  end
end
