require 'spec_helper'

describe MySQLDates do
  it "converts ruby dates into mysql formatted dates" do
    MySQLDates.convert(Date.parse("Dec 25, 1979")).should == "1979-12-25"
  end
end