require 'rspec'
require 'pg'
require 'Purchase'
require 'Budget'
require 'Business'
require 'Category'

DB = PG.connect({ :dbname => 'expense_tracker_test' })

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("TRUNCATE TABLE purchase RESTART IDENTITY;")
  end
end
