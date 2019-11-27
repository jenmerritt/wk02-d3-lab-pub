class Customer

  attr_reader :name, :wallet

 def initialize(name, wallet)
   @name = name
   @wallet = wallet
 end

 def remove_price_of_drink_from_wallet(price)
   @wallet -= price
 end

end
