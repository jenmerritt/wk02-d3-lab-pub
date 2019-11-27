require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../customer')
require_relative('../drink')

class PubTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 4, 5)
    @drink2 = Drink.new("Wine", 1, 7)
    @drink3 = Drink.new("Spirit", 5, 10)

    @customer1 = Customer.new("Andrew", 50, 36)
    @customer2 = Customer.new("John", 50, 17)

    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("The Southern", 1000, @drinks)

  end

  def test_has_name
    assert_equal("The Southern", @pub.name)
  end

  def test_amount_of_cash_in_till
    assert_equal(1000, @pub.till)
  end

  def test_can_find_drink_by_name__found()
    drink = @pub.find_drink_by_name("Beer")
    assert_equal(@drink1, drink)
  end

  def test_can_find_drink_by_name__not_found()
    drink = @pub.find_drink_by_name("Whisky")
    assert_nil(drink)
  end

  def test_can_add_price_of_drink_to_till()
    @pub.add_price_of_drink_to_till(@drink1.price)
    assert_equal(1004, @pub.till)
  end

  def test_stock_count()
    assert_equal(3, @pub.stock_count)
  end

  def test_remove_drink_from_stock()
    @pub.remove_drink_from_stock(@drink3)
    assert_equal(2, @pub.stock_count())
  end

  def test_can_sell_to_customer__true
    assert_equal(true, @pub.can_sell_to_customer(@customer1))
  end

  def test_can_sell_to_customer__false
    assert_equal(false, @pub.can_sell_to_customer(@customer2))
  end

  def test_check_customer_drunkenness__drunk()
    @customer1.have_a_drink(@drink3)
    @customer1.have_a_drink(@drink3)
    @customer1.have_a_drink(@drink3)
    @customer1.have_a_drink(@drink3)
    @customer1.have_a_drink(@drink3)
    drunk = @pub.check_customer_drunkenness(@customer1)
    assert_equal(true, drunk)
  end

  def test_can_sell_drink_to_customer__under_age()
    @pub.sell_drink_to_customer("Spirit", @customer2)
    assert_equal(3, @pub.stock_count())
    assert_equal(50, @customer2.wallet)
    assert_equal(0, @customer2.drunkenness_level)
    assert_equal(1000, @pub.till)
  end

  def test_can_sell_drink_to_customer__legal_age()
    @pub.sell_drink_to_customer("Spirit", @customer1)
    assert_equal(2, @pub.stock_count())
    assert_equal(45, @customer1.wallet)
    assert_equal(10, @customer1.drunkenness_level)
    assert_equal(1005, @pub.till)
  end

end
