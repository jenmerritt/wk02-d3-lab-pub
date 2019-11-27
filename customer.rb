class Customer

  attr_reader :name, :wallet, :age, :drunkenness_level

 def initialize(name, wallet, age)
   @name = name
   @wallet = wallet
   @age = age
   @drunkenness_level = 0
 end

 def remove_price_of_drink_from_wallet(price)
   @wallet -= price
 end

end
