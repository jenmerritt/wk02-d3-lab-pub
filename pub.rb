class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks = [])
    @name = name
    @till = till
    @drinks = drinks
  end

  def find_drink_by_name(drink_name)
    for drink in @drinks
      return drink if drink.name == drink_name
    end
    return nil
  end

  def add_price_of_drink_to_till(price)
    @till += price
  end

  def stock_count()
    return @drinks.count
  end

  def remove_drink_from_stock(drink_name)
    drink = find_drink_by_name(drink_name)
    @drinks.delete(drink)
  end

  def sell_drink_to_customer(drink_name, customer)
    drink = find_drink_by_name(drink_name)
    customer.remove_price_of_drink_from_wallet(drink.price)
    add_price_of_drink_to_till(drink.price)
  end

end
