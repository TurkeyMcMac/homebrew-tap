class Tmv2 < Formula
  desc "Player for ASCII art animations that renders to the terminal"
  homepage "https://github.com/TurkeyMcMac/tmv2"
  url "https://github.com/TurkeyMcMac/tmv2/archive/0a10938e954279c0c0ce4147a2605c9d1e1acc31.tar.gz"
  version "0.1.3"
  sha256 "e39ccf78dada0efc6d712115a5f852289a2f4f1ea413fcc5359f89b525e4c988"

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
