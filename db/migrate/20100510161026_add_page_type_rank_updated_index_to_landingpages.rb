class AddPageTypeRankUpdatedIndexToLandingpages < ActiveRecord::Migration
  def self.up
    add_index :landingpages, [:page_type, :rank_updated_at]
  end

  def self.down
    remove_index :landingpages, [:page_type, :rank_updated_at]
  end
end
