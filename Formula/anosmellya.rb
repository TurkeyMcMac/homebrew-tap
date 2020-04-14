class Intergrid < Formula
  desc "Smell-based simulator of evolution through sexual reproduction"
  homepage "https://github.com/TurkeyMcMac/anosmellya"
  url "https://github.com/TurkeyMcMac/anosmellya/archive/ddf741cfa6f1a2a3e7748ab5c1f4924599ec9917.tar.gz"
  version "0.4.1"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"

  depends_on "sdl2"

  def install
    system "make", "CXXFLAGS=-O3 -flto"
    bin.install "anosmellya"
  end

  test do
    shell_output "anosmellya -no-draw -print-stats | head -n 1"
  end
end
