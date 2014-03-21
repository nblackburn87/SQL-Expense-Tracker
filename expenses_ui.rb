require 'pg'
require './lib/Purchase'

DB = PG.connect({ :dbname => 'expense_tracker' })


def welcome
  puts "Welcome to Expense Organizer"

  main_menu
end

def main_menu
  puts "\n\n"

  puts "A - add an expense"
  puts "V - view all expenses"
  puts "E - edit an expense"
  puts "D - delete an expense"
  puts "S - search for a specific expense"
  puts "X - exit the program"

  case gets.chomp.upcase
  when 'A'
    add_expense
  when 'V'
    view_expenses
  when 'E'
    edit_expense
  when 'D'
    delete_expense
  when 'S'
    search_expense
  when 'X'
    puts "Goodbye"
    exit
  else
    puts "Invalid input"
    main_menu
  end
end

def add_expense
  puts "\n\n"
  print "Enter the description: "
  description = gets.chomp
  print "Enter the amount: "
  print "$"
  amount = gets.chomp.to_f
  print "Enter the date(year-month-day): "
  date = gets.chomp
  Purchase.create({ 'description' => description, 'amount' => amount, 'date' => date })
  puts "\n\n#{description} was added to your expense list."
  puts "\n\n"
  main_menu
end

def view_expenses
  puts "\n\n"
  purchases = Purchase.all
  purchases.each_with_index do |purchase, index|
    puts "#{index+1}) #{purchase.description}, purchased for #{purchase.amount}, on #{purchase.date}"
  end
  puts "\n\n"
  main_menu
end



welcome
