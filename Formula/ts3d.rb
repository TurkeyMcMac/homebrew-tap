class Ts3d < Formula
  desc "Terminal-based first-person shooter"
  homepage "https://github.com/TurkeyMcMac/ts3d"
  url "https://github.com/TurkeyMcMac/ts3d/archive/master.zip"
  version "1.3.14"
  sha256 "948371ecd5afa9004409e7866706edee91e82a9ff43c2997617b0705dd7c1836"

  depends_on "ncurses"

  def install
    exe_dir = "#{prefix}/bin"
    man_dir = "#{prefix}/man/man6"
    ts3d_root = "#{prefix}/ts3d-root"
    system 'mkdir', '-p', exe_dir, man_dir, ts3d_root
    system 'make', 'CFLAGS="-O2"'
    system 'sh', '-c', '--', 'yes | make install exe=ts3d-real exe-dir="$0" man-dir="$1" TS3D_ROOT="$2"', exe_dir, man_dir, ts3d_root
    File.open("#{exe_dir}/ts3d", 'w') do |file|
      file.write <<~SH
        #!/bin/sh
        export TS3D_ROOT="#{ts3d_root}"
        #{exe_dir}/ts3d-real "$@"
      SH
    end
    system 'chmod', '+x', "#{exe_dir}/ts3d"
  end

  def test
    puts 'TODO'
    system "false"
  end
end
