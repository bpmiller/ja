class AddTop100RankToLandingpages < ActiveRecord::Migration
  def self.up
    add_column :landingpages, :top100_rank, :integer, :precision => 5, :scale => 0
  end

  def self.down
    remove_column :landingpages, :top100_rank
  end
end
