class Piks < Formula
  desc "Evolution simulator similar to Conway's Game of Life"
  homepage "https://github.com/TurkeyMcMac/piks"
  url "https://github.com/TurkeyMcMac/piks/archive/7c220c4c863a7f269ca74e2b84fcca9ede2042a2.tar.gz"
  version "0.6.1"
  sha256 "54f0c5750d4f4663d97617e7af01d4eabbc79600f91762497013db29406aedc5"

  depends_on "ncurses"

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
