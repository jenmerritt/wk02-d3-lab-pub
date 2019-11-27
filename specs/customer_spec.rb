require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')

class CustomerTest < MiniTest::Test

  def setup

    @customer1 = Customer.new("Andrew", 50)

  end

  def test_customer_has_name
    assert_equal("Andrew", @customer1.name)
  end

  def test_amount_of_cash_in_wallet
    assert_equal(50, @customer1.wallet)
  end

end
