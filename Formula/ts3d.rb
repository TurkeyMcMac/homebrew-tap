class TS3D < Formula
  desc "Terminal-based first-person shooter"
  homepage "https://github.com/TurkeyMcMac/ts3d"
  url "https://github.com/TurkeyMcMac/ts3d/archive/master.zip"

  depends_on "ncurses"

  def install
    system 'sh', '-c', 'yes | make install exe-dir="$1" man-dir="$2"', "#{prefix}/bin/", "#{prefix}/man/man6/"
  end

  def test
    puts 'TODO'
    system "false"
  end
end
