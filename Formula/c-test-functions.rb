class CTestFunctions < Formula
  desc "Simple unit testing framework for C"
  homepage "https://github.com/TurkeyMcMac/c-test-functions"
  url "https://github.com/TurkeyMcMac/c-test-functions/archive/034917842231094d82bacc8deac9f3b9e2e9c2f7.tar.gz"
  version "0.8.5"
  sha256 "1bbbe42da0633b4f8183e64034d2a27192bab7b8ca98eab2ca4ef82c85dc26b6"

  def install
    system "make"
    bin.install "ceeteef"
    include.install "lib/libctf.h"
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
