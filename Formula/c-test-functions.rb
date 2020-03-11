class CTestFunctions < Formula
  desc "Simple unit testing framework for C"
  homepage "https://github.com/TurkeyMcMac/c-test-functions"
  url "https://github.com/TurkeyMcMac/c-test-functions/archive/a38ce3c318cf949240713603936997a275d89b34.tar.gz"
  version "0.8.9"
  sha256 "32930ccc72073387e312682e41c55df1efa9b03f31c0c8f37bf46149bf5e4078"

  def install
    system "make"
    bin.install "ceeteef"
    include.install "lib/libctf.h"
    man1.install "ceeteef.1"
    man3.install "ctf.3"
  end

  def caveats
    'The executable is called "ceeteeef", and the header is "libctf.h"'
  end

  test do
    test = Pathname.new("test")
    test_c = Pathname.new("test.c")
    test_c.write <<~C
      #include <assert.h>
      #include <libctf.h>
      #include <stdio.h>
      CTF_TEST(succeed,
      )
      CTF_TEST(succeed_return_0,
        return 0;
      )
      CTF_TEST(fail_assert,
        assert(1 != 1);
      )
      CTF_TEST(fail_return_1,
        return 1;
      )
      CTF_TEST(print,
        puts("stdout");
        fputs("stderr\\n", stderr);
      )
    C
    system ENV.cc, "-std=c99", "-shared", "-DCTF_TESTS_ENABLED", "-o", test, test_c
    output = shell_output "ceeteef #{test}"
    assert_match /^succeed SUCCEEDED$/, output
    assert_match /^succeed_return_0 SUCCEEDED$/, output
    assert_match /^fail_assert FAILED/, output
    assert_match /^fail_return_1 FAILED/, output
    assert_match /^print:stdout$/, output
    assert_match /^print:stderr$/, output
  end
end
