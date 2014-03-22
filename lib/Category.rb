class Category

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.create(name)
    new_category = Category.new({'name' => name})
    new_category.save
    new_category
  end

  def self.all
    category = []
    results = DB.exec("SELECT * FROM category;")
    results.each do |result|
      category << Category.new(result)
    end
    category
  end

  def ==(another_entry)
    self.id == another_entry.id && self.name == another_entry.name
  end

  def save
    results = DB.exec("INSERT INTO category (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    results = DB.exec("DELETE FROM category where id = '#{@id}';")
  end

  #  def self.find_by_description(input)
  #   results = DB.exec("SELECT * FROM purchase WHERE description = '#{input}';")
  #   purchases = []
  #   results.each do |result|
  #     purchases << Purchase.new(result)
  #   end
  #   purchases
  # end

end
