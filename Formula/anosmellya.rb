class Anosmellya < Formula
  desc "Smell-based simulator of evolution through sexual reproduction"
  homepage "https://github.com/TurkeyMcMac/anosmellya"
  url "https://github.com/TurkeyMcMac/anosmellya/archive/ddf741cfa6f1a2a3e7748ab5c1f4924599ec9917.tar.gz"
  version "0.4.1"
  sha256 "2ee97ceec84569183df27c7ef6a59ccecf3a9492f7bc8054bca786cd159ddd0d"

  depends_on "sdl2"

  def install
    system "make", "CXXFLAGS=-O3 -flto"
    bin.install "anosmellya"
  end

  test do
    shell_output "anosmellya -no-draw -print-stats | head -n 1"
  end
end
