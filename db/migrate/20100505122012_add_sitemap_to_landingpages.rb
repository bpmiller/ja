class AddSitemapToLandingpages < ActiveRecord::Migration
  def self.up
    add_column :landingpages, :sitemap, :string
  end

  def self.down
    remove_column :landingpages, :sitemap
  end
end
