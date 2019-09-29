class CashRegister
    attr_accessor :total, :discount, :last_transaction, :items

    def initialize(discount = 0)
        @total = 0 
        @discount = discount
        @items = []
        @last_transaction = []
    end

    def add_item(item, price, quantity = 1)
        self.total += (price * quantity)
        self.last_transaction = price * quantity
        self.items.fill(item, self.items.count, quantity)
    end

    def apply_discount
        if discount != 0 
            self.total -= self.total*self.discount/100
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction 
        self.total = self.total - self.last_transaction
    end 
end
