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

class Landingpage < ActiveRecord::Base
end
