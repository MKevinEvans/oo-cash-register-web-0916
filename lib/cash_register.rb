require 'pry'

class CashRegister
  attr_accessor :discount, :total


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def discount
    @discount
  end

  def apply_discount
  	if @discount != 0
    @total = @total*(1-(@discount/100.0))
    @total = @total.to_i
    "After the discount, the total comes to $#{@total}."
	else
		"There is no discount to apply."
	end

  end

  def items
  	@items
  end

  def add_item(item, price, quant=1)
  	@last_quant = quant
    quant.times do @items.push(item) end
    @last_cost = (price * quant)
    @total += (price * quant)
  end

  def void_last_transaction
  	@total = @total-@last_cost
  end

  def subtract_last_item
  	@last_quant.times do @items.pop end
  end
end
