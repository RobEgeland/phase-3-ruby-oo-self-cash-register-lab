require "pry"

class CashRegister
    attr_accessor :total, :discount, :items, :prices

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    

    def add_item(title, price, quantity = 1)
        if quantity > 1
            i = 1
            self.total += price * quantity
            while i <= quantity do
                self.items << title
                self.prices << price
                i += 1
            end
        else
            self.total += price
            self.items << title
            self.prices << price
        end
    end

    def apply_discount
        if self.discount > 0
            self.total = self.total - self.total * self.discount / 100
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        if self.prices[-1] == self.prices[-2]
            self.total = 0.0
        else
            self.total -= prices[-1]
        end
    end


    
    
        
end
