class RenamePagerankToPageRank < ActiveRecord::Migration
  def self.up
    rename_column :landingpages, :pagerank, :page_rank
  end

  def self.down
    rename_column :landingpages, :page_rank, :pagerank
  end
end
