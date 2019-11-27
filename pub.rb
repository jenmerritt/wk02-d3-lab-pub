# require('pry')
# binding.pry

class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks = [])
    @name = name
    @till = till
    @drinks = drinks
  end

  # def find_drink_by_name(drink_name)
  #   for drink in @drinks
  #     return drink if drink.name == drink_name
  #   end
  #   return nil
  # end

  def add_price_of_item_to_till(price)
    @till += price
  end

  def stock_count()
    return @drinks.count
  end

  def stock_value()
    total = 0
    for drink in @drinks
      total += drink.price
    end
    return total
  end

  def remove_drink_from_stock(drink)
    @drinks.delete(drink)
  end

  def can_sell_to_customer(customer)
    if customer.age > 17
      return true
    end
    return false
  end

  def check_customer_drunkenness(customer)
    if customer.drunkenness_level >= 50
      return true
    end
    return false
  end

  def sell_drink_to_customer(drink, customer)
    legal = can_sell_to_customer(customer)
    drunk = check_customer_drunkenness(customer)
    can_afford = customer.can_afford_item(drink)
    if legal == true && drunk == false && can_afford == true
      remove_drink_from_stock(drink)
      customer.remove_price_of_item_from_wallet(drink.price)
      customer.have_a_drink(drink)
      add_price_of_item_to_till(drink.price)
    end
  end

  def sell_food_to_customer(food, customer)
    can_afford = customer.can_afford_item(food)
    if can_afford == true
      customer.eat_food(food)
      customer.remove_price_of_item_from_wallet(food.price)
      add_price_of_item_to_till(food.price)
    end
  end

end
