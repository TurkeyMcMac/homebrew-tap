class Mmmaze < Formula
  VERSION = "0.5.8".freeze
  desc "Game about collecting money in a maze and escaping from monsters"
  homepage "https://github.com/TurkeyMcMac/mmmaze"
  url "https://github.com/TurkeyMcMac/mmmaze/archive/v#{VERSION}.tar.gz"
  version VERSION
  sha256 "62614546306618173c0cc471c590e356a43ce34ae5209557712450777f394f75"

  def install
    system "make"
    bin.install "mmmaze"
  end

  test do
    # Make sure the right executable runs:
    assert_match VERSION, (shell_output "mmmaze -v")
  end
end
