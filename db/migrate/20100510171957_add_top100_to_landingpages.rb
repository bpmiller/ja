class AddTop100ToLandingpages < ActiveRecord::Migration
  def self.up
    add_column :landingpages, :top100, :boolean, :default => false
  end

  def self.down
    remove_column :landingpages, :top100
  end
end
