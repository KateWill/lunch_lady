# Basic Objectives:
# - the user chooses from a list of main dishes
# - the user chooses 2 side dish items
# - computer repeats users order
# - computer totals lunch items and displays total
require 'pry'
require_relative 'order_print'
require_relative 'person'


# - when to create a new instance of Order? When menu is called again?
# class Person method = Order person.order
# Person had wallet with amount
# Module place order
# initialize = print_menu - (first method to run) 


class Order
  include OrderPrint
   
  def initialize
    # @person = person
    # p @person
    # p @@wallet 
    @@order_choices = []
    @@order_history = []
  end
  
  def print_main_menu
    puts
    puts "Main Menu"
    puts "1) Submit an order"
    puts "2) Check wallet amount"
    puts "3) Check purchase history"
    puts "4) Exit"
    puts
    # get_user_input
  end

  def main_menu(choice, wallet)
    @wallet = wallet
    @choice = choice
    case @choice
    when 1
      # puts 'Make an order'
      print_main_dish_menu
      # get_user_input
      menu_options(@choice)
      main_menu(@choice, @wallet)
    when 2
      puts "Check wallet amount"
      # print_wallet_amount
      print_wallet(@wallet)
      print_main_menu
      get_user_input
      main_menu(@choice, @wallet)
    when 3
      puts "Check purchase history"
      print_purchase_history
      print_main_menu
      get_user_input
      main_menu(@choice, @wallet)
    when 4
      puts "GoodBye!"
      exit
    else
     puts "Invalid choice try again.."
    end # end case
  end

  def print_main_dish_menu
    puts 
    puts "Main Dish Menu"
    puts
    puts "Please select a main dish from below:"
    puts "1) Pizza -> $3.00"
    puts "2) Nuggets -> $2.50"
    puts "3) Salad -> $2.00"
    puts "4) Burger -> $3.99"
    get_user_input
  end # end method

  def print_sides
    puts 
    puts "Side Dish Menu"
    puts
    puts "Please select a side dish from below:"
    puts "1) French Fries -> $1.50"
    puts "2) Soup -> $1.00"
    puts "3) Tots -> $1.75"
    puts "4) Fruit Cup -> $2.00"
  end

  def get_user_input
    @choice = gets.to_i
  end # end method
  
  def sides_options(choice)
    case @choice
    when 1
      puts 'French Fries'
      @@order_choices  << ['French Fries', 1.50]
      # p @@order_choices
    when 2
      puts 'Soup'
      @@order_choices << ['Soup', 1.00]
      # p @@order_choices
    when 3
      puts 'Tots'
      @@order_choices << ['Tots', 1.75]
      # p @@order_choices
    when 4
      puts 'Fruit Cup'
      @@order_choices << ['Fruit Cup', 2.00]
      # p @@order_choices
    else
     puts 'Invalid choice try again..'
    end # end case
  end # end method

  def menu_options(choice)
    # @order_choices = []
    # @order_choices = order_choices
    
    case @choice
    when 1
      puts 'Add Pizza'
      @@order_choices << ['Pizza', 3.00]
    when 2
      puts 'Add Nuggets'
      @@order_choices << ['Nuggets', 2.50]
    when 3
      puts 'Add Salad'
      @@order_choices << ['Salad', 2.00]
    when 4
      puts 'Add Burger'
      @@order_choices << ['Burger', 3.99]
    else
     puts 'Invalid choice try again..'
    end # end case
    
    # ask for sides again
    @count = 0 

    while @count < 2
      print_sides
      get_user_input
      sides_options(@choice) 
      @count = @count + 1
    end

    print_order(@@order_choices, @wallet, @@order_history)
    # @@order_choices.each do |item|
    #   @@order_history << item
    # end
    @@order_choices.clear
    print_main_menu
    get_user_input
    main_menu(@choice, @wallet)
  end # end method

  def print_purchase_history
  #  p @@order_choices
    puts
    puts "Your Purchase History:"
    puts
    @@order_history.each_with_index do |item, index|
      # puts "#{index + 1}) #{item[0]} -> #{item[1]}"
      puts "#{item[0]} -> #{item[1]}"
    end
    # p @@order_history
  end

end #end class


# @order = Order.new

# @order.print_menu
# @order.print_main_menu
# @order.menu_options(@choice)
# @order.main_menu(@choice)
# main_menu
# @order.get_user_input


# @order.print_sides
# @order.get_user_input
# @order.sides_options(@choice)

# @order.print_sides
# @order.get_user_input
# @order.create_order(@@order_choices[1], @@order_choices[2], @@order_choices[3])
# @order.print_order


