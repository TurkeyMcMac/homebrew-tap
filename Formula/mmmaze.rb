class Mmmaze < Formula
  VERSION = "0.5.14".freeze
  desc "Game about collecting money in a maze and escaping from monsters"
  homepage "https://github.com/TurkeyMcMac/mmmaze"
  url "https://github.com/TurkeyMcMac/mmmaze/archive/v#{VERSION}.tar.gz"
  version VERSION
  sha256 "77d8915f7094c32883de532aef7045c8a6dc4017203fc1fded794a4c52cbfc97"

  def install
    system "make"
    bin.install "mmmaze"
  end

  test do
    # Make sure the right executable runs:
    assert_match VERSION, (shell_output "mmmaze -v")
  end
end
