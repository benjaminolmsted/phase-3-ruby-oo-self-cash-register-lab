
class CashRegister
    def initialize(employee_discount = 0) 
        @total = 0
        @discount = employee_discount
        @items = []
        @transactions = []
    end
    attr_reader :discount, :total, :items
    attr_writer :total

    def add_item(item, price, quantity = 1)
        self.total = @total + price*quantity
        quantity.times do
          @items << item
        end  
        @transactions << price*quantity
    end

    def apply_discount
        if @discount != 0
            self.total = @total - (@total * (@discount/100.0) )
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = @total - @transactions.last
        @transactions.pop
    end

end