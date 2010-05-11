class AddPagetransToLandingpages < ActiveRecord::Migration
  def self.up
    add_column :landingpages, :page_trans, :string, :limit => 4
  end

  def self.down
    remove_column :landingpages, :page_trans
  end
end
