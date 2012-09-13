require 'minitest/autorun'
require_relative '../lib/meme.rb'

class TestMeme < MiniTest::Unit::TestCase
  def setup
    @meme = Meme.new
  end

  def test_that_kitty_can_eat
    assert_equal "OHAI!", @meme.i_can_has_cheezburger?
  end

  def test_that_it_will_not_blend
    refute_match %r/^no/, @meme.will_it_blend?
  end
end
