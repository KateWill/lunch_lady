
# A module acts as a library where you can put code that needs to be shared between different classes or other modules

# A module cannot and will not be instantiated ever! 
require_relative 'person'
require_relative 'lunch_lady'

module OrderPrint
  
    # @@wallet 
    # p "wallet: #{@@wallet}"
  

  def print_order(order_choices, wallet, history)
    @@order_history = history
    @@order_choices = order_choices

    @wallet = wallet.to_f
    # p "wallet: #{@wallet}"
    # @order_choice = order_choice
    @total = 0
    puts
    puts "Your Order:"
    @@order_choices.each do |choice|
      # p choice
    #   choice.each do |food_price|
    #     p food_price
        
    # # puts "Your order is: #{food[0]} with #{food[1]}!"
    #   end
    @total += choice[1]
    printf "#{choice[0]} -> $%.2f" %choice[1]
    puts
    end
    puts
    puts "Your Total:"
    printf "$%.2f" % @total
    puts
    if @total < @wallet
      @wallet -= @total
      
      @@order_choices.each do |item|
        @@order_history << item
      end

    else
      puts
      puts "Error: Not enough money in wallet!"

    end
  end
  def print_wallet(wallet)
    @wallet = wallet.to_f
    puts
    puts "Your Wallet has:"
    printf "$%.2f" % @wallet
    puts
  end
end