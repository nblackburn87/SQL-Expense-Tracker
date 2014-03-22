require 'spec_helper'


describe 'Purchase' do
  describe '#initialize' do
    it 'is initialized with a description, amount, date, and id' do
      test_purchase = Purchase.new({ 'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014-03-21' })
      test_purchase.should be_an_instance_of Purchase
    end
  end

  describe '.create' do
    it 'initializes and saves a new instance' do
      test_purchase = Purchase.create({ 'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014-03-21' })
      Purchase.all.should eq [test_purchase]
    end
  end

  describe '#save' do
    it 'saves a purchase to the database' do
      test_purchase = Purchase.new({ 'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014-03-21' })
      test_purchase.save
      Purchase.all.should eq [test_purchase]
    end
  end

  describe '.all' do
    it 'should return an array of all the purchases' do
      test_purchase = Purchase.new({ 'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014-03-21' })
      test_purchase.save
      Purchase.all.should eq [test_purchase]
    end
  end

  describe '==' do
    it 'compares two objects by attribute to check if the are the same' do
      test_purchase1 = Purchase.new({ 'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014-03-21', 'id' => 1 })
      test_purchase2 = Purchase.new({ 'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014-03-21', 'id' => 1 })
      test_purchase1.should eq test_purchase2
    end
  end

  # describe '#destroy' do
  #   it 'removes an instance from the database' do
  #     test_purchase = Purchase.new({ 'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014-03-21', 'id' => 1 })
  #     test_purchase.save
  #     test_purchase.destroy
  #     Purchase.all.should eq []
  #   end
  # end

  describe '.find_by_description' do
    it 'should return an array of purchases with the description' do
      test_purchase1 = Purchase.create({ 'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014-03-21' })
      test_purchase2 = Purchase.create({ 'description' => 'Beer', 'amount' => '16.50', 'date' => '2014-03-20' })
      test_purchase3 = Purchase.create({ 'description' => 'Beer', 'amount' => '2.50', 'date' => '2014-02-20' })
      Purchase.find_by_description('Beer').should eq [test_purchase2, test_purchase3]
    end
  end

  describe '#update' do
    it 'updates an attribute' do
      test_purchase = Purchase.create({ 'description' => 'Beer', 'amount' => '16.50', 'date' => '2014-03-20' })
      test_purchase.update({ 'description' => 'Wine' })
      test_purchase.description.should eq 'Wine'
      test_purchase.update({ 'amount' => '8.95' })
      test_purchase.amount.should eq 8.95
      test_purchase.update({ 'date' => '2000-01-01' })
      test_purchase.date.should eq '2000-01-01'
    end
  end

  describe '#search_purchase' do
    it 'searches purchases and returns a list of items that match the search' do
      test_purchase_1 = Purchase.create({ 'description' => 'Candy', 'amount' => '1.50', 'date' => '2014-03-20' })
      test_purchase_2 = Purchase.create({ 'description' => 'Beer', 'amount' => '16.50', 'date' => '2014-03-20' })


end




