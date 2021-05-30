require 'pry'

class CashRegister
  attr_accessor :total, :last_item
  attr_reader :discount, :basket

  def initialize(e_disc = 0)
    @total = 0
    @discount = e_disc
    @basket = []
    @last_item = []
  end

  def add_item(title, price, quantity = 1)
    counter = 0
    while counter < quantity
      @basket << title
      counter += 1
    end
    @total = @total + price * quantity
    @last_item = [title, price, quantity]
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total - @total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @basket
  end

  def void_last_transaction
    @total = @total - @last_item[1] * @last_item[2]
  end

end
