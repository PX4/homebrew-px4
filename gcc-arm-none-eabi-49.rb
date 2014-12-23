require 'formula'

class GccArmNoneEabi49 < Formula
  homepage 'https://launchpad.net/gcc-arm-embdded'
  version '20141203'
  url 'http://launchpadlibrarian.net/192227901/gcc-arm-none-eabi-4_9-2014q4-20141203-mac.tar.bz2'
  sha1 '46767b358cc42ffe126aec68afb9d22bd0ef5beb'

  def install 
    ohai 'Copying binaries...'
    system 'cp', '-rv', 'arm-none-eabi', 'bin', 'lib', 'share', "#{prefix}/"
  end
end
