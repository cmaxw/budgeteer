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
    t1 = account.transactions.create({:payee => "ABC Store", :payment_date => Time.now})
    t2 = account.transactions.create({:payee => "ABC Store", :payment_date => 1.month.ago})
    t3 = account.transactions.create({:payee => "ABC Store", :payment_date => 1.week.ago})
    t4 = account.transactions.create({:payee => "ABC Store", :payment_date => 1.day.ago})
    transactions = account.transactions_by_date_range((1.month.ago + 1.day).strftime('%Y-%m-%d %H:%M:%S'), 1.day.ago.strftime('%Y-%m-%d %H:%M:%S'))
    transactions.should be_include(t4)
    transactions.should be_include(t3)
    transactions.should_not be_include(t2)
    transactions.should_not be_include(t1)
  end
end
