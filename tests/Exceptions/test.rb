require 'test/unit'
require_relative '../../Finder.rb'

class TestExceptions < Test::Unit::TestCase
  def test_black
    assert_throw(DirectoryNotExist) do
      Reader.new('').tolist
    end
  end
end
