class Tmv2 < Formula
  desc "Player for ASCII art animations that renders to the terminal"
  homepage "https://github.com/TurkeyMcMac/tmv2"
  url "https://github.com/TurkeyMcMac/tmv2/archive/214db3deed366d67bcd2dd506741214aba503692.tar.gz"
  version "0.1.5"
  sha256 "c96f70f383e69057d37a1b75279006433a9aeb9cfd430a4be980a41c043facf3"

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
