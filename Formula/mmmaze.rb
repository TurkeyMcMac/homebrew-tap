class Mmmaze < Formula
  VERSION = "0.5.10".freeze
  desc "Game about collecting money in a maze and escaping from monsters"
  homepage "https://github.com/TurkeyMcMac/mmmaze"
  url "https://github.com/TurkeyMcMac/mmmaze/archive/v#{VERSION}.tar.gz"
  version VERSION
  sha256 "427e1db6315b3cd3bae7b259c4aef34b26a9238dd3e0c5eec5346de2f9be8d70"

  def install
    system "make"
    bin.install "mmmaze"
  end

  test do
    # Make sure the right executable runs:
    assert_match VERSION, (shell_output "mmmaze -v")
  end
end
