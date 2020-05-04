require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'all'

class AllTest < Minitest::Test
  def test_all
    refute(all?([1, 3, 5, 6]) { |value| value.odd? })
    assert(all?([1, 3, 5, 7]) { |value| value.odd? })
    assert(all?([2, 4, 6, 8]) { |value| value.even? })
    refute(all?([1, 3, 5, 7]) { |value| value % 5 == 0 })
    assert(all?([1, 3, 5, 7]) { |value| true })
    refute(all?([1, 3, 5, 7]) { |value| false })
    assert(all?([]) { |value| false })
  end
end