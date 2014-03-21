class Purchase

  attr_reader :description, :amount, :date, :id

  def initialize(attributes)
    @description = attributes['description']
    @amount = attributes['amount']
    @date = attributes['date']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM purchase;")
    purchases = []
    results.each do |result|
      # purchase_description = result['description']
      # purchase_amount = result['amount']
      # purchase_date = result['date']
      # purchase_id = result['id']
      purchases << Purchase.new(result)
    end
    purchases
  end

  def save
    result = DB.exec("INSERT INTO purchase (description, amount, date) VALUES ('#{@description}', '#{@amount}', '#{@date}') RETURNING id;")
    @id = result.first['id']
  end

  def == (another_purchase)

  end
end
