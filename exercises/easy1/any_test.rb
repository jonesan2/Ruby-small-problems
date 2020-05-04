require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'any'

class AnyTest < Minitest::Test
  def test_any
    assert(any?([1, 3, 5, 6]) { |value| value.even? })
    refute(any?([1, 3, 5, 7]) { |value| value.even? })
    refute(any?([2, 4, 6, 8]) { |value| value.odd? })
    assert(any?([1, 3, 5, 7]) { |value| value % 5 == 0 })
    assert(any?([1, 3, 5, 7]) { |value| true })
    refute(any?([1, 3, 5, 7]) { |value| false })
    refute(any?([]) { |value| true })
  end
end