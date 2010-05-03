# == Schema Information
# Schema version: 20100503193452
#
# Table name: landingpages
#
#  id         :integer(4)      not null, primary key
#  url        :string(255)
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Landingpage do
  before(:each) do
    @valid_attributes = {
      :url => "value for url",
      :title => "value for title"
    }
  end

  it "should create a new instance given valid attributes" do
    Landingpage.create!(@valid_attributes)
  end
end
