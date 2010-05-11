class AddPagetypeToLandingpages < ActiveRecord::Migration
  def self.up
    add_column :landingpages, :page_type, :string, :null => false, :limit => 1
  end

  def self.down
    remove_column :landingpages, :page_type
  end
end
