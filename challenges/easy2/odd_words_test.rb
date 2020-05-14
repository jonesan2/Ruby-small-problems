require 'minitest/autorun'
require_relative 'odd_words'

class OddWordsTest < MiniTest::Test
  def test_kansas
    test_string = "whats the matter with kansas."
    exp_string = "whats eht matter htiw kansas."
    act_string = test_string.flip_odd_words
    assert_equal(exp_string, act_string)
  end
  
  def test_arkansas
    test_string = "whats the matter with my arkansas."
    exp_string = "whats eht matter htiw my sasnakra."
    act_string = test_string.flip_odd_words
    assert_equal(exp_string, act_string)
  end
  
  def test_middle_period
    test_string = "whats the matter with kansas. i don't know"
    exp_string = "whats eht matter htiw kansas."
    act_string = test_string.flip_odd_words
    assert_equal(exp_string, act_string)
  end
end