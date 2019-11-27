require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food')

class FoodTest < MiniTest::Test

  def setup
    @food1 = Food.new("Burger", 7, 5)
  end

  def test_has_name
    assert_equal("Burger", @food1.name)
  end

  def test_has_price
    assert_equal(7, @food1.price)
  end

  def test_has_rejuvenation_level
    assert_equal(5, @food1.rejuvenation_level)
  end

end
