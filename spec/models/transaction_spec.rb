# == Schema Information
# Schema version: 20100202035923
#
# Table name: transactions
#
#  id                  :integer(4)      not null, primary key
#  check_number        :string(255)
#  transaction_type_id :integer(4)
#  payee               :string(255)
#  amount              :float
#  cleared             :boolean(1)
#  created_at          :datetime
#  updated_at          :datetime
#

require 'spec_helper'

describe Transaction do
  before(:each) do
    @valid_attributes = {
      :check_number => "value for check_number",
      :transaction_type_id => 1,
      :payee => "value for payee",
      :amount => 1.5,
      :payment_date => ,
      :cleared => false
    }
  end

  it "should create a new instance given valid attributes" do
    Transaction.create!(@valid_attributes)
  end
end
