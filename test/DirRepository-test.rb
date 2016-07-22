require 'test/unit'
require_relative '../src/DirRepository'

class CommandTest < Test::Unit::TestCase
  def test_make
    dirrepo = DirRepository.new("Prog0","Ex",1,7)
    dirrepo.make
    a = ["Ex1","Ex2","Ex3","Ex4","Ex5","Ex6","Ex7"]
    assert_equal (1..7).to_a.map{|item| true},a.map{|item| Dir.exist?(item)}
  end
end
