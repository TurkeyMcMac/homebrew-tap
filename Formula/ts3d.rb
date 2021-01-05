class Ts3d < Formula
  VERSION = "1.15.1".freeze
  desc "Terminal-based first-person shooter"
  homepage "https://github.com/TurkeyMcMac/ts3d"
  url "https://github.com/TurkeyMcMac/ts3d/archive/v#{VERSION}.tar.gz"
  version VERSION
  sha256 "a88126a6c72a6534dfd597091a50ed1a42eb99a65321c0952bb52b3b26c66ea6"

  def install
    exe = bin/"ts3d"
    exe_real = bin/"ts3d-no-data"
    ts3d_data = share
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
      Unlike with manually installed ts3d, the default game data location is #{share} rather than ~/.ts3d/data.
      This can still be overriden as always by setting $TS3D_DATA or using the -d option.
      Alternatively, another executable 'ts3d-no-data' is provided without this override.
    EOT
  end

  test do
    # Make sure the right executable runs:
    assert_match VERSION, (shell_output "ts3d -v")
  end
end
