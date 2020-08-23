class Anosmellya < Formula
  desc "Smell-based simulator of evolution through sexual reproduction"
  homepage "https://github.com/TurkeyMcMac/anosmellya"
  url "https://github.com/TurkeyMcMac/anosmellya/archive/a77a49fd6df701ed82a4457ea8dd9799491039ba.tar.gz"
  version "0.8.0"
  sha256 "be47f4323cdbc1c54102e76e9b115056925fc50cf1c2d20edc30bfeb41a48a83"

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
