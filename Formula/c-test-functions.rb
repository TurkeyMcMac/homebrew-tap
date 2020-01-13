class CTestFunctions < Formula
  desc "A simple unit testing framework for C"
  homepage "https://github.com/TurkeyMcMac/c-test-functions"
  url "http://github.com/TurkeyMcMac/c-test-functions/archive/83a24faaf43f23094b7891c2806f42250b8fe083.zip"
  version "0.6.15"
  sha256 "a2ce0a4179bdc0c30867aa613b2d564381abf6bd1c41686dc068712eead15527"

  def install
    system 'make'
    bin.install 'ceeteef'
    include.install 'lib/libctf.h'
  end
end
