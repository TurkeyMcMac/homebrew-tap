class Ts3d < Formula
  desc "Terminal-based first-person shooter"
  version "1.3.14"
  @@download_commit = "d748de7befacedcd6d094839303310ffd34a8bb3"
  homepage "https://github.com/TurkeyMcMac/ts3d/tree/#{@@download_commit}"
  @@download_url = "https://github.com/TurkeyMcMac/ts3d/archive/#{@@download_commit}.zip"
  url @@download_url
  sha256 "e96ed7acad951c6553a1a925452be13e076897561fdeca19417a13c878384fe7"

  depends_on "ncurses"
  depends_on "turkeymcmac/tap/c-test-functions" => :test
  depends_on "wget" => :test
  # Hopefully included by default:
  # depends_on "zip" => :test

  def install
    exe = bin/"ts3d"
    exe_real = bin/"ts3d-no-root"
    ts3d_root = prefix/"ts3d-root"
    system 'mkdir', '-p', bin, man6, ts3d_root
    system 'make', 'CFLAGS=-O2'
    system 'sh', '-c', '--', 'yes | make install exe=ts3d-no-root exe-dir="$0" man-dir="$1" TS3D_ROOT="$2"', bin, man6, ts3d_root
    exe.write <<~SH
      #!/bin/bash
      [ -z "${TS3D_ROOT+x}" ] && export TS3D_ROOT="#{ts3d_root}"
      exec -a "$(basename "$0")" #{exe_real} "$@"
    SH
    system 'chmod', '+x', exe
    puts "NOTE: Game files are present in #{ts3d_root}"
  end

  test do
    system 'wget', @@download_url
    system 'unzip', "#{@@download_commit}.zip"
    system 'make', '-C', "ts3d-#{@@download_commit}", 'run-tests'
  end
end
