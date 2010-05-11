class AddPagerankToLandingpages < ActiveRecord::Migration
  def self.up
    add_column :landingpages, :pagerank, :decimal, :precision => 2, :scale => 0 
  end

  def self.down
    remove_column :landingpages, :pagerank
  end
end
