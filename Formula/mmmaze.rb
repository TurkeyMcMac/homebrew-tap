class Mmmaze < Formula
  VERSION = "0.5.11".freeze
  desc "Game about collecting money in a maze and escaping from monsters"
  homepage "https://github.com/TurkeyMcMac/mmmaze"
  url "https://github.com/TurkeyMcMac/mmmaze/archive/v#{VERSION}.tar.gz"
  version VERSION
  sha256 "df560c54fe53cef859eab75135e53554abb0cecd5dc11e424eab2e83096d5d0c"

  def install
    system "make"
    bin.install "mmmaze"
  end

  test do
    # Make sure the right executable runs:
    assert_match VERSION, (shell_output "mmmaze -v")
  end
end
