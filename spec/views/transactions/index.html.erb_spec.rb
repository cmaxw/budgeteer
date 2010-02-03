require 'spec_helper'

describe "/transactions/index.html.erb" do
  include TransactionsHelper

  before(:each) do
    assigns[:transactions] = [
      stub_model(Transaction),
      stub_model(Transaction)
    ]
  end

  it "renders a list of transactions" do
    render
  end
end
