class Ts3d < Formula
  DOWNLOAD_COMMIT = "966134daf830d4ffe806f5f67958a92eeaabec74".freeze
  DOWNLOAD_URL = "https://github.com/TurkeyMcMac/ts3d/archive/#{DOWNLOAD_COMMIT}.tar.gz".freeze
  desc "Terminal-based first-person shooter"
  homepage "https://github.com/TurkeyMcMac/ts3d"
  url DOWNLOAD_URL
  version "1.4.1"
  sha256 "cc33061c6ab544aa46bcc9fde758aa1c7fe7784fcb175e7009d5728daf09ad96"

  depends_on "turkeymcmac/tap/c-test-functions" => :test
  depends_on "ncurses"

  def install
    exe = bin/"ts3d"
    exe_real = bin/"ts3d-no-data"
    ts3d_data = prefix/"game-data"
    mkdir_p bin
    mkdir_p man6
    mkdir_p ts3d_data
    system "make", "CFLAGS=-O2 -flto"
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
      Alternatively, another executable 'ts3d-no-data' is provided without this override.
    EOT
  end

  test do
    # Make sure the executable runs:
    system "ts3d", "-v"
    # Run unit tests:
    system "curl", "-LO", DOWNLOAD_URL
    system "tar", "-xzvf", "#{DOWNLOAD_COMMIT}.tar.gz"
    system "make", "-C", "ts3d-#{DOWNLOAD_COMMIT}", "run-tests"
  end
end
