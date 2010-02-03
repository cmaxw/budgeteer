# == Schema Information
# Schema version: 20100202035923
#
# Table name: transaction_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe TransactionType do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    TransactionType.create!(@valid_attributes)
  end
end
