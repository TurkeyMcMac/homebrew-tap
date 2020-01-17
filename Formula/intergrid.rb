class Intergrid < Formula
  desc "Ecological simulator/screensaver"
  homepage "https://github.com/TurkeyMcMac/intergrid"
  url "https://github.com/TurkeyMcMac/intergrid/archive/1408b2e89dcbb55d2da6f860e67af25b82476560.tar.gz"
  version "0.3.3"
  sha256 "8d6cfb35597998f86449f7a2d78669f0b20a4b5a3665b3d2b5e0cb5d3760d023"

  depends_on "sdl2"

  def install
    system "make", "CXXFLAGS=-O3 -flto"
    bin.install "intergrid"
  end

  test do
    system "intergrid", "-no-draw", "-print-stats", "-tick-limit", "100", "-frame-delay", "0"
  end
end
