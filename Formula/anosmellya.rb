class Anosmellya < Formula
  desc "Smell-based simulator of evolution through sexual reproduction"
  homepage "https://github.com/TurkeyMcMac/anosmellya"
  url "https://github.com/TurkeyMcMac/anosmellya/archive/893677f900aa5d6c5419be87ed84e16830da7340.tar.gz"
  version "0.5.0"
  sha256 "2eaf54d75af01ff9fb3b6f7c4b4d43a542ed65b8f01af0a64b6a5d2c84f3a5ed"

  depends_on "sdl2"

  def install
    system "make", "CXXFLAGS=-O3 -flto"
    bin.install "anosmellya"
  end

  test do
    shell_output "anosmellya -no-draw -print-stats | head -n 1"
  end
end
