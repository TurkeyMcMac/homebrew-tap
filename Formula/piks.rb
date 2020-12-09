class Piks < Formula
  desc "Evolution simulator similar to Conway's Game of Life"
  homepage "https://github.com/TurkeyMcMac/piks"
  url "https://github.com/TurkeyMcMac/piks/archive/aa422d7a64836d543977a89a05692f548d9687ad.tar.gz"
  version "0.7.1"
  sha256 "7eeaec2031c76816b52d1e405b928edf7d3ca891dcb94c6dfeec72966364be32"

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
