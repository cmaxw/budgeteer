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
