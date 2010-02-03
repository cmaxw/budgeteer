require 'spec_helper'

describe "/transactions/new.html.erb" do
  include TransactionsHelper

  before(:each) do
    assigns[:transaction] = stub_model(Transaction,
      :new_record? => true
    )
  end

  it "renders new transaction form" do
    render

    response.should have_tag("form[action=?][method=post]", transactions_path) do
    end
  end
end
