class CTestFunctions < Formula
  desc "A simple unit testing framework for C"
  homepage "https://github.com/TurkeyMcMac/c-test-functions"
  url "http://github.com/TurkeyMcMac/c-test-functions/archive/83a24faaf43f23094b7891c2806f42250b8fe083.zip"
  version "0.6.15"
  sha256 "a2ce0a4179bdc0c30867aa613b2d564381abf6bd1c41686dc068712eead15527"

  def install
    system 'make'
    bin.install 'ceeteef'
    include.install 'lib/libctf.h'
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
    system ENV.cc, '-std=c99', '-shared', '-DCTF_TESTS_ENABLED', '-o', test, test_c
    output = `ceeteef #{test}`
    assert output.include? 'succeed SUCCEEDED'
    assert output.include? 'succeed_return_0 SUCCEEDED'
    assert output.include? 'fail_assert FAILED'
    assert output.include? 'fail_return_1 FAILED'
    assert output.include? 'print:stdout'
    assert output.include? 'print:stderr'
  end
end
