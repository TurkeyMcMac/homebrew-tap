class Piks < Formula
  desc "Evolution simulator similar to Conway's Game of Life"
  homepage "https://github.com/TurkeyMcMac/piks"
  url "https://github.com/TurkeyMcMac/piks/archive/2cb85cd3e03ab199c75a7008a0efa53619b54b57.tar.gz"
  version "0.6.4"
  sha256 "a2a3a51a327fc5986dc6e6b200ec0d09b8aae2c42848a80f12db7701ebccb2e4"

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
