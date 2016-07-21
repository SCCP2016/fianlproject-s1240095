require 'test/unit'
require_relative '../src/CommandParser'

class CommandParserTest < Test::Unit::TestCase
  def test_parse
    argv=["generate","Prog0","-h","Ex","-format","1","-m","13"]
    cmdpr = CommandParser.new(argv)
    assert_equal 8, cmdpr.argv.count
  end
end
