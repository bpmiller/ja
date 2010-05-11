class AddIndexToLandingpages < ActiveRecord::Migration
  def self.up
    add_index :landingpages, :url
  end

  def self.down
    remove_index :landingpages, :url
  end
end
