class Anosmellya < Formula
  desc "Smell-based simulator of evolution through sexual reproduction"
  homepage "https://github.com/TurkeyMcMac/anosmellya"
  url "https://github.com/TurkeyMcMac/anosmellya/archive/971ee18680f2da087b52e31d94c284f4308c8a5c.tar.gz"
  version "0.7.1"
  sha256 "018830e0269b7f62e61e67084c50a2619f7a62d5f4b388e61cfa2decee3fe6e6"

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
