
class CashRegister
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @items_cost = []
        @ref = []
    end

    attr_reader :discount
    attr_accessor :total

    def add_item(title, price, quantity=1)
        @ref << quantity
        quantity.times do
            @total = @total + price 
            @items << title
            @items_cost << price
        end
    end

    def apply_discount
        if @discount > 0
            @total = @total - (@total * discount / 100)
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end 
    end

    def items
        @items
    end 

    def void_last_transaction
        @ref.pop.times do
            @total = @total - @items_cost.pop
            @items.pop
        end
    end
end
