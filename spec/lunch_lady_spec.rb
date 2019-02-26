require 'spec_helper'
require_relative '../lunch_lady.rb'

describe Menu do 
  before(:each) do
    @print_menu = Menu.new
  end

it "Prints menu" do
  expected = "\nMENU\nPlease select a main dish from below:\n1) Pizza\n2) Nuggets\n3) Salad\n4) Burger\n"
  expect { @print_menu.print_menu }.to output(expected).to_stdout
  end
end