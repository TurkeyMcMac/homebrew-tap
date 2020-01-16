class Piks < Formula
  DOWNLOAD_COMMIT = "07d2bf7c343fd6668caf1d972e0da8622fc7014a".freeze
  desc "Evolution simulator similar to Conway's Game of Life"
  homepage "https://github.com/TurkeyMcMac/piks/tree/#{DOWNLOAD_COMMIT}"
  url "https://github.com/TurkeyMcMac/piks/archive/#{DOWNLOAD_COMMIT}.tar.gz"
  version "0.5.7"
  sha256 "6154a500c62dcaee35b90139a226711ebdd27a86edb0a26f502a6db59fd0d121"

  def install
    system "make", "CFLAGS=-O3 -flto"
    bin.install "piks"
    man6.install "piks.6"
  end

  test do
    system "piks", "-otest.piks", "-W1000", "-H1000", "-p1000", "-g", "-S5"
  end
end
