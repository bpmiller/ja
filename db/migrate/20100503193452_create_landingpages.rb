class CreateLandingpages < ActiveRecord::Migration
  def self.up
    create_table :landingpages do |t|
      t.column :url, :string 
      t.column :title, :string 
      t.timestamps
      t.column :lastmod, :datetime
      t.column :changefreq, :string
      t.column :priority, :decimal, :precision => 3, :scale => 1
    end
  end

  def self.down
    drop_table :landingpages
  end
end
