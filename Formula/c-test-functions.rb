class CTestFunctions < Formula
  DOWNLOAD_COMMIT = "83a24faaf43f23094b7891c2806f42250b8fe083".freeze
  desc "Simple unit testing framework for C"
  homepage "https://github.com/TurkeyMcMac/c-test-functions/tree/#{DOWNLOAD_COMMIT}"
  url "https://github.com/TurkeyMcMac/c-test-functions/archive/#{DOWNLOAD_COMMIT}.tar.gz"
  version "0.6.15"
  sha256 "2b49224dd1a77ef1bd3b5e5abca673782baa46c360b160d51d824ab6d48bd3fc"

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
    output = `ceeteef #{test}`
    assert_match /^succeed SUCCEEDED$/, output
    assert_match /^succeed_return_0 SUCCEEDED$/, output
    assert_match /^fail_assert FAILED/, output
    assert_match /^fail_return_1 FAILED/, output
    assert_match /^print:stdout$/, output
    assert_match /^print:stderr$/, output
  end
end
