class Intergrid < Formula
  desc "An ecological simulator/screensaver"
  homepage "https://github.com/TurkeyMcMac/intergrid"
  url "https://github.com/TurkeyMcMac/intergrid/archive/1408b2e89dcbb55d2da6f860e67af25b82476560.zip"
  version "0.3.3"
  sha256 "cd765fe375555534a15410aea7f1fad6e97c74af30fc37ec214a77dc9c44db8e"

  depends_on "sdl2"

  def install
    system 'make', 'CXXFLAGS=-O3 -flto'
    bin.install 'intergrid'
  end
end
