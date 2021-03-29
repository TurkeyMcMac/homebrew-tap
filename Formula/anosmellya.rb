class Anosmellya < Formula
  desc "Smell-based simulator of evolution through sexual reproduction"
  homepage "https://github.com/TurkeyMcMac/anosmellya"
  url "https://github.com/TurkeyMcMac/anosmellya/archive/bc38bfd00851d3edc4eccc1dee6e3a93f05d0321.tar.gz"
  version "0.9.5"
  sha256 "fa2699bc97249abde4e70306bff1fe4243ad22d3b4540f457e1ebc1f2fb246fd"

  depends_on "sdl2"

  def install
    system "make", "CXXFLAGS=-O3 -flto -march=native"
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
