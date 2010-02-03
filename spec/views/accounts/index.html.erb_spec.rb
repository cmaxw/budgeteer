require 'spec_helper'

describe "/accounts/index.html.erb" do
  include AccountsHelper

  before(:each) do
    assigns[:accounts] = [
      stub_model(Account),
      stub_model(Account)
    ]
  end

  it "renders a list of accounts" do
    render
  end
end
