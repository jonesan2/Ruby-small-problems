require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'swap_letters'

class SwapLettersTest < MiniTest::Test
  def setup
    @textfile = File.open('textfile.txt', 'r')
    @text = File.read(@textfile)
  end
  
  def test_swap_letters
    text_obj = Text.new(@text)
    swapped = text_obj.swap('a', 'e')
    refute swapped.include? 'a'
    assert_equal @text.gsub('a', 'e'), swapped
  end
  
  def test_word_count
    text_obj = Text.new(@text)
    assert_equal @text.split.count, text_obj.word_count
  end
  
  def teardown
    @textfile.close
    puts "File has been closed: #{@textfile.closed?}"
  end
end

