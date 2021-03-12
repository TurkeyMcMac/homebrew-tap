class Tmv2 < Formula
  desc "Player for ASCII art animations that renders to the terminal"
  homepage "https://github.com/TurkeyMcMac/tmv2"
  url "https://github.com/TurkeyMcMac/tmv2/archive/535dbfc6627bde318ac37843861caa626daa1a2b.tar.gz"
  version "0.1.7"
  sha256 "2319ad92345a69cf6ad8bf8ff9698ffceded88e3362309ac770938a0cd34323a"

  def install
    system "make", "OPTIMIZATION=-O3"
    mkdir_p bin
    bin.install "tmv2"
    mkdir_p man6
    man6.install "tmv2.6.gz"
  end

  test do
    shell_output "printf '\\na\\n\\n a\\n\\n  a' | TERM=xterm tmv2"
  end
end
