class Ts3d < Formula
  DOWNLOAD_COMMIT = "5661def7682362d4a0436848ef8740bf06945df3".freeze
  DOWNLOAD_URL = "https://github.com/TurkeyMcMac/ts3d/archive/#{DOWNLOAD_COMMIT}.tar.gz".freeze
  desc "Terminal-based first-person shooter"
  homepage "https://github.com/TurkeyMcMac/ts3d/tree/#{DOWNLOAD_COMMIT}"
  url DOWNLOAD_URL
  version "1.3.18"
  sha256 "76909a7dbdba381ba85865c676ff05de7f3e97dac046109e43063549cbc7c2fa"

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
    system "sh", "-c", 'yes | make install exe=ts3d-no-data exe-dir="$0" man-dir="$1" TS3D_DATA="$2"', bin, man6, ts3d_data
    exe.write <<~SH
      #!/bin/bash
      [ -z "${TS3D_DATA+x}" ] && export TS3D_DATA="#{ts3d_data}"
      exec -a "$(basename "$0")" #{exe_real} "$@"
    SH
    chmod "+x", exe
  end

  def caveats
    <<~EOT
      Unlike with manually installed ts3d, the default game data location is #{prefix}/game-data rather than ~/.ts3d/data.
      This can still be overriden as always by setting $TS3D_DATA or using the -d option.
    EOT
  end

  test do
    system "wget", DOWNLOAD_URL
    system "tar", "-xzvf", "#{DOWNLOAD_COMMIT}.tar.gz"
    system "make", "-C", "ts3d-#{DOWNLOAD_COMMIT}", "run-tests"
  end
end
