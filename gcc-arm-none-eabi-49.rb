require 'formula'

class GccArmNoneEabi49 < Formula
  homepage 'https://launchpad.net/gcc-arm-embedded'
  version '20150609'
  url 'https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q2-update/+download/gcc-arm-none-eabi-4_9-2015q2-20150609-mac.tar.bz2'
  sha1 '7f2d8c3644cd76da1b78d17a0770c8c0efbff957'

  def install 
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
