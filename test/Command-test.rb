require 'test/unit'
require_relative '../src/Command'

class CommandTest < Test::Unit::TestCase
  def test_init
    cmd = Command.new("generate","Prog0","Ex",1,13)
    assert_equal "generate", cmd.type
    assert_equal "Prog0", cmd.dir_name
    assert_equal "Ex", cmd.header
    assert_equal 1, cmd.format
    assert_equal 13, cmd.max
  end
end
