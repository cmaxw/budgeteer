require 'spec_helper'

describe "/check_register/edit" do
  before(:each) do
    render 'check_register/edit'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/check_register/edit])
  end
end
