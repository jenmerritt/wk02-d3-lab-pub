require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../customer')
require_relative('../drink')

class PubTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 4)
    @drink2 = Drink.new("Wine", 1)
    @drink3 = Drink.new("Spirit", 5)

    @customer1 = Customer.new("Andrew", 50)

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

end
