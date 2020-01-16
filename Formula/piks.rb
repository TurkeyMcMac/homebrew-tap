class Piks < Formula
  DOWNLOAD_COMMIT = "7406752d2b0d0731e58092f12a7c65398e165aef".freeze
  desc "Evolution simulator similar to Conway's Game of Life"
  homepage "https://github.com/TurkeyMcMac/piks/tree/#{DOWNLOAD_COMMIT}"
  url "https://github.com/TurkeyMcMac/piks/archive/#{DOWNLOAD_COMMIT}.tar.gz"
  version "0.5.6"
  sha256 "149c1266e96b6f72ccb8006db740adeba7ceed320e1706b82f5c15bfdd89d4b2"

  def install
    system "make", "CFLAGS=-O3 -flto"
    bin.install "piks"
    man6.install "piks.6"
  end

  test do
    system "piks", "-otest.piks", "-W1000", "-H1000", "-p1000", "-g", "-S5"
  end
end
