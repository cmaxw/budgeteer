require 'spec_helper'

describe AccountHelper do

  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(AccountHelper)
  end

  it "adjusts the running total on a credit and returns the result" do
    result = helper.adjust_total(100, mock("transaction",
      :transaction_type => mock("transaction_type", :name => "debit", :credit? => true), :amount => 10))
    result.should == 110
  end

  it "adjusts the running total on a credit and returns the result" do
    result = helper.adjust_total(100, mock("transaction",
      :transaction_type => mock("transaction_type", :name => "debit", :credit? => false), :amount => 10))
    result.should == 90
  end
end
