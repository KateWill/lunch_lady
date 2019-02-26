
class Person 
  attr_accessor :name, :wallet_amount, :diet

  def initialize (name, wallet_amount, diet)
    @name = name
    @wallet = wallet_amount.to_f
    @diet = diet
  end

  def start_order
    @order = Order.new
    @order.print_main_menu
    @choice = gets.to_i
    # @wallet = @person.wallet_amount
    # p "Main.rb #{@wallet}"
    @order.main_menu(@choice, @wallet)
  end

end
