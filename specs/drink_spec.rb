require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup

    @drink = Drink.new("Hop House Beer", 4, 5)

  end

  def test_drink_has_name
    assert_equal("Hop House Beer", @drink.name)
  end

  def test_drink_has_price
    assert_equal(4, @drink.price)
  end

  def test_drink_has_alcohol_level
    assert_equal(5, @drink.alcohol_level)
  end

end
