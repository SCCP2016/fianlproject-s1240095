# -*- coding: utf-8 -*-
require 'test/unit'
require_relative '../src/hello'

class HelloTest < Test::Unit::TestCase
  def test_greeting
    hello = Hello.new
    assert_equal 'Hello!', hello.greeting
  end

end
