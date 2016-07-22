require 'test/unit'
require_relative '../src/CommandParser'

class CommandParserTest < Test::Unit::TestCase
  def test_parse
    argv=["generate","Prog0","-h","Ex","-format","1","-m","13"]
    cmdpr = CommandParser.new(argv)
    assert_equal 8, cmdpr.argv.count
    assert_equal "generate", cmdpr.parse.type
    assert_equal "Prog0", cmdpr.parse.dir_name
    assert_equal "Ex", cmdpr.parse.header
    assert_equal 1, cmdpr.parse.format
    assert_equal 13, cmdpr.parse.max
  end
end
