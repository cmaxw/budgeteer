require 'spec_helper'

describe CheckRegisterController do

  #Delete these examples and add some real ones
  it "should use CheckRegisterController" do
    controller.should be_an_instance_of(CheckRegisterController)
  end


  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end
end
