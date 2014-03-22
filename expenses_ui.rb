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

def edit_expense
  puts "\n"
  purchases = Purchase.all
  purchases.each_with_index do |purchase, index|
    puts "#{index+1}) #{purchase.description}, purchased for #{purchase.amount}, on #{purchase.date}"
    end
  puts "Choose a purchase to edit: "
  edit_input = gets.chomp.to_i
  this_purchase = purchases[edit_input - 1]
  puts "Description: '#{this_purchase.description}', $ #{this_purchase.amount}, Date: #{this_purchase.description}'"
  puts "D to edit description"
  puts "A to edit amount"
  puts "DATE to edit date"
  selection = gets.chomp.upcase
  case selection
  when 'D'
    puts "Enter new description: "
    new_description = gets.chomp
    this_purchase.update('description' => new_description)
    puts "EDITED!!!"
    puts "Description: '#{this_purchase.description}', $ #{this_purchase.amount}, Date: #{this_purchase.date}'"
  when 'A'
    puts "Enter new amount: "
    new_amount = gets.chomp
    this_purchase.update('amount' => new_amount)
    puts "EDITED!!!"
    puts "Description: '#{this_purchase.description}', $ #{this_purchase.amount}, Date: #{this_purchase.date}'"
  when 'DATE'
    puts "Enter new date: "
    new_date = gets.chomp
    this_purchase.update('date' => new_date)
    puts "EDITED!!!"
    puts "Description: '#{this_purchase.description}', $ #{this_purchase.amount}, Date: #{this_purchase.date}'"
  end
  puts "Edit another expense? (Y/N)"
  another_edit = gets.chomp.upcase
  case another_edit
  when 'Y' then edit_expense
  when 'N' then main_menu
  else
  puts "Not a valid response. Choose again."
  edit_expense
  end
end

def delete_expense
  purchases = Purchase.all
  purchases.each_with_index do |purchase, index|
    puts "#{index+1}) #{purchase.description}, purchased for #{purchase.amount}, on #{purchase.date}"
    end
  puts "Choose a purchase to delete: "
  delete_input = gets.chomp.to_i
  delete_purchase = purchases[delete_input - 1].delete
  puts "Deleted."
  puts "Delete another expense? (Y/N)"
  another_delete = gets.chomp.upcase
  case another_delete
  when 'Y' then delete_expense
  when 'N' then main_menu
  else
    puts "Not a valid response. Choose again."
    delete_expense
  end
end

def search_expense



end

main_menu
