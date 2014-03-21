require 'spec_helper'


describe 'Purchase' do
  describe '#initialize' do
    it 'is initialized with a description, amount, date, and id' do
      test_purchase = Purchase.new({'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014/03/21'})
      test_purchase.should be_an_instance_of Purchase
    end
  end

  describe '#save' do
    it 'saves a purchase to the database' do
      test_purchase = Purchase.new({'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014/03/21'})
      test_purchase.save
      Purchase.all.should eq [test_purchase]
    end
  end
  describe '.all' do
    it 'should return an array of all the purchases' do
      test_purchase = Purchase.new({'description' => 'Coffee', 'amount' => '6.50', 'date' => '2014/03/21'})
      test_purchase.save
      Purchase.all.should eq [test_purchase]
    end
  end
end
