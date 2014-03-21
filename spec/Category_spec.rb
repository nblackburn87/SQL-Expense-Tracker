require 'spec_helper'

describe Category do
  describe '.create' do
    it 'Creates and saves an instance of categories' do
      test_category = Category.create('Interesting Stuff')
      test_category.should be_an_instance_of Category
    end
  end
end
