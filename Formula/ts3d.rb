class Ts3d < Formula
  desc "Terminal-based first-person shooter"
  homepage "https://github.com/TurkeyMcMac/ts3d"
  url "http://github.com/TurkeyMcMac/ts3d/archive/03b380574b56b2a72b4f5380b52c96dddcaa1bf4.zip"
  version "1.3.14"
  sha256 "d31351d5b99e42641ab534a5f56bb0bcf76b3311448a96fd663c442cce1072dd"

  depends_on "ncurses"

  def install
    exe = bin/"ts3d"
    exe_real = bin/"ts3d-real"
    man_dir = prefix/"man/man6"
    ts3d_root = prefix/"ts3d-root"
    system 'mkdir', '-p', bin, man6, ts3d_root
    system 'make', 'CFLAGS="-O2"'
    system 'sh', '-c', '--', 'yes | make install exe=ts3d-real exe-dir="$0" man-dir="$1" TS3D_ROOT="$2"', bin, man6, ts3d_root
    File.open(exe, 'w') do |file|
      file.write <<~SH
        #!/bin/bash
        [ -z "${TS3D_ROOT+x}" ] && export TS3D_ROOT="#{ts3d_root}"
        exec #{exe_real} "$@"
      SH
    end
    system 'chmod', '+x', exe
    puts "NOTE: Game files are present in #{ts3d_root}"
  end

  def test
    puts 'TODO'
    system "false"
  end
end
