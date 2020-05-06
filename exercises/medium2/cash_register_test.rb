require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @reg = CashRegister.new(100)
    @trans = Transaction.new(25)
    @trans.amount_paid = 30 
  end
  
  def test_accept_money
    previous_money = @reg.total_money
    @reg.accept_money(@trans)
    assert_equal(previous_money + @trans.amount_paid, @reg.total_money)
  end
  
  def test_change
    assert_equal(@trans.amount_paid - @trans.item_cost, @reg.change(@trans))
  end
  
  def test_give_receipt
    assert_output("You've paid $25.\n") { @reg.give_receipt(@trans) }
  end
end

