class Mmmaze < Formula
  VERSION = "0.5.3".freeze
  desc "Game about collecting money in a maze and escaping from monsters"
  homepage "https://github.com/TurkeyMcMac/mmmaze"
  url "https://github.com/TurkeyMcMac/mmmaze/archive/v#{VERSION}.tar.gz"
  version VERSION
  sha256 "e233b696c1db8925e156ade3763ffbaf7486a99fc75cf8f4ba2d5a64a0cf2380"

  def install
    system "make"
    bin.install "mmmaze"
  end

  test do
    # Make sure the right executable runs:
    assert_match VERSION, (shell_output "mmmaze -v")
  end
end
