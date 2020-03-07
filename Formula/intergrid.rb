class Intergrid < Formula
  desc "Ecological simulator/screensaver"
  homepage "https://github.com/TurkeyMcMac/intergrid"
  url "https://github.com/TurkeyMcMac/intergrid/archive/31ba0b3a1f7a96d3e3c2d6b9aa79662811917870.tar.gz"
  version "0.3.5"
  sha256 "cef3926635bc9c980f9e28652d70072d02c4d85ae211853f75a6565c77499707"

  depends_on "sdl2"

  def install
    system "make", "CXXFLAGS=-O3 -flto"
    bin.install "intergrid"
  end

  test do
    system "intergrid", "-no-draw", "-print-stats", "-tick-limit", "100", "-frame-delay", "0"
  end
end
