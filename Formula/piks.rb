class Piks < Formula
  DOWNLOAD_COMMIT = "3011f84f88c3084ec862bdb9203ce079dd0322d6".freeze
  desc "Evolution simulator similar to Conway's Game of Life"
  homepage "https://github.com/TurkeyMcMac/piks/tree/#{DOWNLOAD_COMMIT}"
  url "https://github.com/TurkeyMcMac/piks/archive/#{DOWNLOAD_COMMIT}.tar.gz"
  version "0.5.5"
  sha256 "99f838f7aec57fbf75b3cc4434a8f1a4c05e86d08d32b4c295f7e200cbb1d363"

  def install
    system "make", "CFLAGS=-O3 -flto"
    bin.install "piks"
  end

  test do
    system "piks", "-otest.piks", "-W1000", "-H1000", "-p1000", "-g", "-S5"
  end
end
