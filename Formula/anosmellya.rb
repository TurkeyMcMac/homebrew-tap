class Anosmellya < Formula
  desc "Smell-based simulator of evolution through sexual reproduction"
  homepage "https://github.com/TurkeyMcMac/anosmellya"
  url "https://github.com/TurkeyMcMac/anosmellya/archive/cce990075d15834046ff6203cd18ae3ad1249e75.tar.gz"
  version "0.9.2"
  sha256 "1b53c3a4f47e32f968dd64ae529c056ca1a58731121c62a920fa97d6944bb307"

  depends_on "sdl2"

  def install
    system "make", "CXXFLAGS=-O3 -flto"
    bin.install "anosmellya"
    share.install "configurations"
  end

  def caveats
    <<~EOT
      Configuration presets are available in #{share/"configurations"}
      Read more about each configuration preset in its respective file.
    EOT
  end

  test do
    shell_output "anosmellya -no-draw -print-stats | head -n 1"
  end
end
