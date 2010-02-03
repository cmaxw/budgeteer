require 'spec_helper'

describe "/transactions/show.html.erb" do
  include TransactionsHelper
  before(:each) do
    assigns[:transaction] = @transaction = stub_model(Transaction)
  end

  it "renders attributes in <p>" do
    render
  end
end
