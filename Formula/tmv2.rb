class Tmv2 < Formula
  desc "Player for ASCII art animations that renders to the terminal"
  homepage "https://github.com/TurkeyMcMac/tmv2"
  url "https://github.com/TurkeyMcMac/tmv2/archive/151d7382d8f02b66614aa08b66f4a5ebd62986ab.tar.gz"
  version "0.1.4"
  sha256 "9791f14bcee1927739d19fc9b463f941ca01bb3f821ded01d33c72f9fee7f3e4"

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
