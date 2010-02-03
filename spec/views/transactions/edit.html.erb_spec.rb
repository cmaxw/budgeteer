require 'spec_helper'

describe "/transactions/edit.html.erb" do
  include TransactionsHelper

  before(:each) do
    assigns[:transaction] = @transaction = stub_model(Transaction,
      :new_record? => false
    )
  end

  it "renders the edit transaction form" do
    render

    response.should have_tag("form[action=#{transaction_path(@transaction)}][method=post]") do
    end
  end
end
