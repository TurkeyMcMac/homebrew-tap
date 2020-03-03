class Intergrid < Formula
  desc "Ecological simulator/screensaver"
  homepage "https://github.com/TurkeyMcMac/intergrid"
  url "https://github.com/TurkeyMcMac/intergrid/archive/09761c2c7dd39871c8e7e5357099f2224b6bb099.tar.gz"
  version "0.3.4"
  sha256 "bb2e994bc67c2bb298cee3bed526d2b1eba6df4e0fddee71ab0afcd834f1f97a"

  depends_on "sdl2"

  def install
    system "make", "CXXFLAGS=-O3 -flto"
    bin.install "intergrid"
  end

  test do
    system "intergrid", "-no-draw", "-print-stats", "-tick-limit", "100", "-frame-delay", "0"
  end
end
