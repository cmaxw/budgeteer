require 'spec_helper'

describe "/check_register/show" do
  before(:each) do
    render 'check_register/show'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/check_register/show])
  end
end
