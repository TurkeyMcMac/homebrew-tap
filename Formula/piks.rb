class Piks < Formula
  desc "Evolution simulator similar to Conway's Game of Life"
  homepage "https://github.com/TurkeyMcMac/piks"
  url "https://github.com/TurkeyMcMac/piks/archive/fc1432ea1586c4081756c6c4cf42b4c8bba7a166.tar.gz"
  version "0.6.0"
  sha256 "87a59b2bba3078f5fb04e370a2e14e58510d70dfb420aaafa1e001612258faa1"

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
