class CTestFunctions < Formula
  desc "Simple unit testing framework for C"
  homepage "https://github.com/TurkeyMcMac/c-test-functions"
  url "https://github.com/TurkeyMcMac/c-test-functions/archive/4a272f874d3573475be5c1be47b09b6fce18b0a2.tar.gz"
  version "0.8.3"
  sha256 "b040228fe0c5b87d09a45d6ebd62085189caf3edda0d62de859ffc0c660616e6"

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
