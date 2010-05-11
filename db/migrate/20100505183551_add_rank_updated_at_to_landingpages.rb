class AddRankUpdatedAtToLandingpages < ActiveRecord::Migration
  def self.up
    add_column :landingpages, :rank_updated_at, :datetime 
  end

  def self.down
    remove_column :landingpages, :rank_updated_at
  end
end
