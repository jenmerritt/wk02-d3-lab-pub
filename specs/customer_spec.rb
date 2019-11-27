require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')

class CustomerTest < MiniTest::Test

  def setup

    @customer1 = Customer.new("Andrew", 50)

    @drink1 = Drink.new("Beer", 4)

  end

  def test_customer_has_name
    assert_equal("Andrew", @customer1.name)
  end

  def test_amount_of_cash_in_wallet
    assert_equal(50, @customer1.wallet)
  end

  def test_remove_price_of_drink_from_wallet()
    @customer1.remove_price_of_drink_from_wallet(@drink1.price)
    assert_equal(46, @customer1.wallet)
  end

end
