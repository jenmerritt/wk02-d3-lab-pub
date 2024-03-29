require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')
require_relative('../food')

class CustomerTest < MiniTest::Test

  def setup

    @customer1 = Customer.new("Andrew", 50, 36)
    @customer2 = Customer.new("John", 30, 17)
    @customer3 = Customer.new("Julia", 5, 23)
    @customer4 = Customer.new("Eric", 2, 43)

    @drink1 = Drink.new("Beer", 4, 5)

    @food1 = Food.new("Burger", 7, 5)

  end

  def test_customer_has_name
    assert_equal("Andrew", @customer1.name())
  end

  def test_amount_of_cash_in_wallet
    assert_equal(50, @customer1.wallet())
  end

  def test_customer_has_age
    assert_equal(36, @customer1.age())
  end

  def test_customer_can_afford_drink__true_more_than
    can_afford_drink = @customer1.can_afford_item(@drink1)
    assert_equal(true, can_afford_drink)
  end

  def test_customer_can_afford_drink__true_equal
    can_afford_drink = @customer3.can_afford_item(@drink1)
    assert_equal(true, can_afford_drink)
  end

  def test_customer_can_afford_drink__false
    can_afford_drink = @customer4.can_afford_item(@drink1)
    assert_equal(false, can_afford_drink)
  end

  def test_customer_has_drunkenness_level
    assert_equal(0, @customer1.drunkenness_level())
  end

  def test_increase_drunkenness_by_alcohol_level()
    @customer1.have_a_drink(@drink1)
    assert_equal(5, @customer1.drunkenness_level())
  end

  def test_reduce_drunkenness_by_rejuvenation_level
    @customer1.have_a_drink(@drink1)
    @customer1.have_a_drink(@drink1)
    @customer1.eat_food(@food1)
    assert_equal(5, @customer1.drunkenness_level())
  end

  def test_remove_price_of_drink_from_wallet()
    @customer1.remove_price_of_item_from_wallet(@drink1.price)
    assert_equal(46, @customer1.wallet())
  end

  def test_remove_price_of_food_from_wallet()
    @customer1.remove_price_of_item_from_wallet(@food1.price)
    assert_equal(43, @customer1.wallet())
  end

end
