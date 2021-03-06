class Piks < Formula
  desc "Evolution simulator similar to Conway's Game of Life"
  homepage "https://github.com/TurkeyMcMac/piks"
  url "https://github.com/TurkeyMcMac/piks/archive/761f3dfe6fa0a851795e1814db0a082856794e52.tar.gz"
  version "0.7.2"
  sha256 "b759e4ec7a95df38b63c466f0bcfaea9813adac467b2822e3d68e3e9cb28d817"

  def install
    system "make", "CFLAGS=-O3 -flto"
    bin.install "piks"
    man6.install "piks.6"
  end

  test do
    system "piks", "-otest.piks", "-W1000", "-H1000", "-p1000", "-g", "-S5"
    system "piks", "-itest.piks", "-g", "-S5"
    system "piks", "-itest.piks", "-g", "-S5"
  end
end
