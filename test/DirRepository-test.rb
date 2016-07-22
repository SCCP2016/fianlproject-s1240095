require 'test/unit'
require_relative '../src/DirRepository'

class CommandTest < Test::Unit::TestCase
  def test_make
    dirrepo=DirRepository.new("Prog0","Ex",1,7)
    a=["Ex1","Ex2","Ex3","Ex4","Ex5","Ex6","Ex7"].each{|item| Dir.make(item,0705)
    assert_equal a.map{|item| item.name},dirrepo.make.map{|item| item.name}
  end
end
