# == Schema Information
# Schema version: 20100202035923
#
# Table name: accounts
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Account do
  before(:each) do
    @valid_attributes = {
      :name => "test account"
    }
  end

  it "should create a new instance given valid attributes" do
    Account.create!(@valid_attributes)
  end

  it "finds the transactions that fall within a certain date range" do
    account = Account.create!(@valid_attributes)
    t1 = account.transactions.create(:payee => "ABC Store", :payment_date => Time.now)
    t2 = account.transactions.create(:payee => "ABC Store", :payment_date => 1.month.ago)
    t3 = account.transactions.create(:payee => "ABC Store", :payment_date => 1.week.ago)
    t4 = account.transactions.create(:payee => "ABC Store", :payment_date => 1.day.ago)
    transactions = account.transactions_by_date_range((1.month.ago + 1.day).strftime('%Y-%m-%d %H:%M:%S'), 1.day.ago.strftime('%Y-%m-%d %H:%M:%S'))
    transactions.should be_include(t4)
    transactions.should be_include(t3)
    transactions.should_not be_include(t2)
    transactions.should_not be_include(t1)
  end

  it "tallys the transactions up to a certain date" do
    account = Account.create!(@valid_attributes)
    debit = TransactionType.create(:name => "Debit", :credit => false)
    credit = TransactionType.create(:name => "Credit", :credit => true)
    t1 = account.transactions.create(:payee => "ABC Store", :payment_date => Time.now, :transaction_type => credit, :amount => 100.00)
    t2 = account.transactions.create(:payee => "ABC Store", :payment_date => 1.month.ago, :transaction_type => debit, :amount => 12.00)
    t3 = account.transactions.create(:payee => "ABC Store", :payment_date => 1.week.ago, :transaction_type => credit, :amount => 15.00)
    t4 = account.transactions.create(:payee => "ABC Store", :payment_date => 1.day.ago, :transaction_type => credit, :amount => 100.00)
    tally = account.tally(1.day.ago)
    tally.should == 103
  end
end
