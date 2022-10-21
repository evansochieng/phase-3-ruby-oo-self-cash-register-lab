# CashRegister class

require "pry"

class CashRegister
    #macros
    attr_accessor :discount, :total, :my_items

    # initialize variables
    def initialize(discount=nil)
        @discount = discount
        @total = 0
        @my_items = [] #initialize an empty array to store items
        @last_items_prices = [] #initialize an empty array to store prices of last items added
    end

    # CashRegister#total
    def total
        @total
    end

    # CashRegister#add_item
    def add_item(title, price, quantity=1)
        # add items to the item array
        quantity.times {@my_items << title}

        # append the prices of the last items added to the prices array
        @last_items_prices << (price * quantity)

        #add item prices to the total
        total_price = price * quantity
        @total += total_price
    end

    # CashRegister#apply_discount
    def apply_discount
        if discount
            my_discount = (@total * (@discount / 100.to_f))
            @total -= my_discount.to_i

            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    # CashRegister#items
    def items
        @my_items
    end

    # CashRegister#void_last_transaction
    def void_last_transaction
        if @last_items_prices.length != 0
            @total -= @last_items_prices[-1]
        else
            return 0.0
        end
    end
end

# Test your code
cashR_test = CashRegister.new(20)

#!!!!!!!!!!!!!!!!!!!WUUUUUUUUUEEEEEEEEEEEHHHHHHHHHHHHHH!!!!!!!!!!!!!!!!!!
#!!!!!!!!!!!!!!!!!!!LIFE HAS NEVER BEEN THIS TOUGH!!!!!!!!!!!!!!!!!!!!!!!