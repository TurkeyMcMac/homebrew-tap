class Anosmellya < Formula
  desc "Smell-based simulator of evolution through sexual reproduction"
  homepage "https://github.com/TurkeyMcMac/anosmellya"
  url "https://github.com/TurkeyMcMac/anosmellya/archive/d57f09b133ad30270b4cf942edc52237b31bbf50.tar.gz"
  version "0.6.4"
  sha256 "ea05b1dd69f0b830851ed8daebebe94615abbd84d13548a22384c734c931f176"

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
