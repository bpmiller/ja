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
    @attr = {
      :url => "/bible/verse/john_3:16\?version=/",
      :title => "John 3:8 NIV - Bible Verse - Just1Word Online Bible"
    }
  end

  it "should create a new instance given valid attributes" do
    Landingpage.create!(@attr)
  end
  it "should require a URL" do
    no_url = Landingpage.new(@attr.merge(:url=>""))
    no_url.should_not be_valid
  end
  it "should require a title" do
    no_title = Landingpage.new(@attr.merge(:title=>""))
    no_title.should_not be_valid
  end

end
