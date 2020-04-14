class Piks < Formula
  desc "Evolution simulator similar to Conway's Game of Life"
  homepage "https://github.com/TurkeyMcMac/piks"
  url "https://github.com/TurkeyMcMac/piks/archive/a57c5661064471ee0e743ac5e287b32ab94dd685.tar.gz"
  version "0.6.5"
  sha256 "be719df3807ee0808ad0cd0d63fdafbf29c901368a1aa702f02f1565306a8291"

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
