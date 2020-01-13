class Ts3d < Formula
  desc "Terminal-based first-person shooter"
  homepage "https://github.com/TurkeyMcMac/ts3d"
  @@download_commit = "03b380574b56b2a72b4f5380b52c96dddcaa1bf4"
  @@download_url = "http://github.com/TurkeyMcMac/ts3d/archive/#{@@download_commit}.zip"
  url @@download_url
  version "1.3.14"
  sha256 "d31351d5b99e42641ab534a5f56bb0bcf76b3311448a96fd663c442cce1072dd"

  depends_on "ncurses"
  depends_on "turkeymcmac/tap/c-test-functions" => :test
  depends_on "wget" => :test
  # Hopefully included by default:
  # depends_on "zip" => :test

  def install
    exe = bin/"ts3d"
    exe_real = bin/"ts3d-real"
    man_dir = prefix/"man/man6"
    ts3d_root = prefix/"ts3d-root"
    system 'mkdir', '-p', bin, man6, ts3d_root
    system 'make', 'CFLAGS="-O2"'
    system 'sh', '-c', '--', 'yes | make install exe=ts3d-real exe-dir="$0" man-dir="$1" TS3D_ROOT="$2"', bin, man6, ts3d_root
    exe.write <<~SH
      #!/bin/bash
      [ -z "${TS3D_ROOT+x}" ] && export TS3D_ROOT="#{ts3d_root}"
      exec #{exe_real} "$@"
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
