require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def setup
    @reg = CashRegister.new(100)
    @trans = Transaction.new(25)
    @trans2 = Transaction.new(35)
  end
  
  def test_prompt_for_payment
    input = StringIO.new("30\n")
    output = StringIO.new
    @trans.prompt_for_payment(input: input, output: output)
    assert_equal 30, @trans.amount_paid
    assert_equal "You owe $25.\nHow much are you paying?\n", output.string
  end
  
  def test_prompt_for_payment2
    input = StringIO.new("30\n40\n")
    output = StringIO.new
    @trans2.prompt_for_payment(input: input, output: output)
    assert_equal 40, @trans2.amount_paid
    assert_equal "You owe $35.\nHow much are you paying?\n" \
                 "That is not the correct amount. " \
                 "Please make sure to pay the full cost.\n" \
                 "You owe $35.\nHow much are you paying?\n", output.string
  end
end
