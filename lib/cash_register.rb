class CashRegister

  attr_accessor :total, :discount
  attr_reader :items, :prices, :last_quantity

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
    @prices = Hash.new
  end

  def add_item(title, price, quantity=1)
    @last_quantity = quantity
    @prices[title] = price
    quantity.times do
      @items << title
    end
    @total += price * quantity
  end

  def apply_discount
    return  "There is no discount to apply." if 0 == @discount
    @total = @total*(100 - @discount)/100
    "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    @last_quantity.times do
      last_item = @items.pop
      @total -= @prices[last_item]
    end
  end

end
