require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class DrinkTest < MiniTest::Test

  def test_drink_has_name
    drink = Drink.new("Hop House Beer", 4)
    assert_equal("Hop House Beer", drink.name)
  end

  def test_drink_has_price
    drink = Drink.new("Hop House Beer", 4)
    assert_equal(4, drink.price)
  end

end
