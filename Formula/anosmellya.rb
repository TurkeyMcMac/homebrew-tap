class Anosmellya < Formula
  desc "Smell-based simulator of evolution through sexual reproduction"
  homepage "https://github.com/TurkeyMcMac/anosmellya"
  url "https://github.com/TurkeyMcMac/anosmellya/archive/d61397e9767523a1d3d215eee3696f5396de35eb.tar.gz"
  version "0.4.2"
  sha256 "6a314e7e376f2a99232babfe8964ae925ff2f522e125f7de43bee35f00917fa4"

  depends_on "sdl2"

  def install
    system "make", "CXXFLAGS=-O3 -flto"
    bin.install "anosmellya"
  end

  test do
    shell_output "anosmellya -no-draw -print-stats | head -n 1"
  end
end
