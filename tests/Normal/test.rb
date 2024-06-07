require 'test/unit'
require_relative '../../Finder.rb'

class TestNormal < Test::Unit::TestCase

  def test_first
    assert_equal ['и', 5], Reader.new('tests\_files').tolist.first
  end
  def test_nil
    assert_equal nil, Reader.new('tests\_files').tolist[" "]
  end
  def test_size
    assert_equal 84, Reader.new('tests\_files').tolist.size
  end
  def test_empty
    assert_equal Hash([]), Reader.new('tests').tolist
  end

  def test_stop_list
    assert_not_equal ['и', 5], Reader.new('tests\_files', ['и']).tolist.first
  end
end
