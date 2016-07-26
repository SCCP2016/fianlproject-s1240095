require 'test/unit'
require_relative '../src/DirRepository'

class CommandTest < Test::Unit::TestCase
  def test_make
    dirrepo = DirRepository.new("Prog0","Ex",2,7)
    dirrepo.make
    a = ["Ex01","Ex02","Ex03","Ex04","Ex05","Ex06","Ex07"]
    assert_equal (1..7).to_a.map{|item| true},a.map{|item| Dir.exist?("Prog0/" + item)}
    assert_equal true , File.exist?("Prog0/.exdirmng.conf")
  end
end
