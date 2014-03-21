require 'pg'
require './lib/Purchase'

DB = PG.connect({ :dbname => 'expense_tracker' })
