require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'none'

class NoneTest < Minitest::Test
  def test_none
    refute(none?([1, 3, 5, 6]) { |value| value.even? })
    assert(none?([1, 3, 5, 7]) { |value| value.even? })
    assert(none?([2, 4, 6, 8]) { |value| value.odd? })
    refute(none?([1, 3, 5, 7]) { |value| value % 5 == 0 })
    refute(none?([1, 3, 5, 7]) { |value| true })
    assert(none?([1, 3, 5, 7]) { |value| false })
    assert(none?([]) { |value| true })
  end
end