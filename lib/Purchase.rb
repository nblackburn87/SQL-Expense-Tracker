class Purchase

  attr_reader :description, :amount, :date, :id

  def initialize(attributes)
    @description = attributes['description']
    @amount = attributes['amount'].to_f
    @date = attributes['date']
    @id = attributes['id'].to_i
  end

  def self.create(attributes)
    new_purchase = Purchase.new(attributes)
    new_purchase.save
    new_purchase
  end

  def self.all
    purchases = []
    results = DB.exec("SELECT * FROM purchase;")
    results.each do |result|
      purchases << Purchase.new(result)
    end
    purchases
  end

   def ==(other)
    self.description == other.description && self.amount == other.amount &&self.date == other.date && self.id == other.id
  end

  def save
    result = DB.exec("INSERT INTO purchase (description, amount, date) VALUES ('#{@description}', #{@amount}, '#{@date}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM purchase WHERE id = #{@id};")
  end

  def self.find_by_description(input)
    results = DB.exec("SELECT * FROM purchase WHERE description = '#{input}';")
    purchases = []
    results.each do |result|
      purchases << Purchase.new(result)
    end
    purchases
  end

  def update(input) #the input needs to be a hash  This allows you to write only one update and update anything.
    @description = if input['description'].nil? then @description else input['description'] end # the next two lines are the same, just better syntax  ? = if  : = else so no need for 'then' or 'end'
    @amount = input['amount'].nil? ? @amount : input['amount'].to_f
    @date = input['date'].nil? ? @date : input['date']

    DB.exec("UPDATE purchase SET description = '#{@description}', amount = #{@amount}, date = '#{@date}' WHERE id = #{@id};")
  end

  def search_purchase(user_input)
    result = DB.exec("SELECT * FROM purchase WHERE description LIKE '%#{user_input}%';")
    result.class
  end

end
