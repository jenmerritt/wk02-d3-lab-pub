class Customer

  attr_reader :name, :wallet, :age, :drunkenness_level

 def initialize(name, wallet, age)
   @name = name
   @wallet = wallet
   @age = age
   @drunkenness_level = 0
 end

 def remove_price_of_item_from_wallet(price)
   @wallet -= price
 end

 def have_a_drink(drink)
   @drunkenness_level += drink.alcohol_level
 end

 def eat_food(food)
   @drunkenness_level -= food.rejuvenation_level
 end

 def can_afford_item(item)
   return @wallet >= item.price
 end

end
