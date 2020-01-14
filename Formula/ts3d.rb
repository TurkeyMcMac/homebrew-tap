class Ts3d < Formula
  DOWNLOAD_COMMIT = "d748de7befacedcd6d094839303310ffd34a8bb3".freeze
  DOWNLOAD_URL = "https://github.com/TurkeyMcMac/ts3d/archive/#{DOWNLOAD_COMMIT}.tar.gz".freeze
  desc "Terminal-based first-person shooter"
  homepage "https://github.com/TurkeyMcMac/ts3d/tree/#{DOWNLOAD_COMMIT}"
  url DOWNLOAD_URL
  version "1.3.14"
  sha256 "7fddf847d4c840c6b2155148b43fa560c19ceaf99bb1323c39db75ba52dbb9b0"

  depends_on "turkeymcmac/tap/c-test-functions" => :test
  depends_on "wget" => :test
  depends_on "ncurses"

  def install
    exe = bin/"ts3d"
    exe_real = bin/"ts3d-no-data"
    ts3d_data = prefix/"game-data"
    mkdir_p bin
    mkdir_p man6
    mkdir_p ts3d_data
    system "make", "CFLAGS=-O2"
    system "sh", "-c", "--", 'yes | make install exe=ts3d-no-data exe-dir="$0" man-dir="$1" TS3D_DATA="$2"', bin, man6, ts3d_data
    exe.write <<~SH
      #!/bin/bash
      [ -z "${TS3D_DATA+x}" ] && export TS3D_DATA="#{ts3d_data}"
      exec -a "$(basename "$0")" #{exe_real} "$@"
    SH
    chmod "+x", exe
  end

  def caveats
    "Game data is present in #{prefix}/game-data"
  end

  test do
    system "wget", DOWNLOAD_URL
    system "tar", "-xzvf", "#{DOWNLOAD_COMMIT}.tar.gz"
    system "make", "-C", "ts3d-#{DOWNLOAD_COMMIT}", "run-tests"
  end
end
