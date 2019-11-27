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

end
