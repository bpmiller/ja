class AddRestOfTotalsToLandingpages < ActiveRecord::Migration
  def self.up
    add_column :landingpages, :bounces, :integer, :default => 0
    add_column :landingpages, :total_links, :integer, :default => 0
    add_column :landingpages, :total_active_links, :integer, :default => 0
    add_column :landingpages, :total_unique_links, :integer, :default => 0
    add_column :landingpages, :total_active_unique_links, :integer, :default => 0
    add_column :landingpages, :landings_from_internal_links, :integer, :default => 0
    add_column :landingpages, :landings_from_internal_search, :integer, :default => 0
    
    # bot activity stats
    add_column :landingpages, :last_scan_by_google_1, :datetime
    add_column :landingpages, :last_scan_by_google_2, :datetime
    add_column :landingpages, :last_scan_by_google_3, :datetime
    add_column :landingpages, :last_scan_by_google_4, :datetime
    add_column :landingpages, :total_scans_by_google, :integer, :default => 0
    add_column :landingpages, :total_days_between_scans_by_google, :integer, :default => 0
    add_column :landingpages, :last_scan_by_yahoo_1, :datetime
    add_column :landingpages, :last_scan_by_yahoo_2, :datetime
    add_column :landingpages, :last_scan_by_yahoo_3, :datetime
    add_column :landingpages, :last_scan_by_yahoo_4, :datetime
    add_column :landingpages, :total_scans_by_yahoo, :integer, :default => 0
    add_column :landingpages, :last_scan_by_other_1, :datetime
    add_column :landingpages, :last_scan_by_other_2, :datetime
    add_column :landingpages, :last_scan_by_other_3, :datetime
    add_column :landingpages, :total_scans_by_other, :integer, :default => 0
    
    # changes to sitemap data
    add_column :landingpages, :previous_rank, :decimal, :precision => 2, :scale => 0
    add_column :landingpages, :previous_priority, :decimal, :precision => 3, :scale => 1
    add_column :landingpages, :previous_lastmod, :datetime
    add_column :landingpages, :previous_changefreq, :string, :limit => 7
  end

  def self.down
    remove_column :landingpages, :bounces
    remove_column :landingpages, :total_links
    remove_column :landingpages, :total_active_links
    remove_column :landingpages, :total_unique_links
    remove_column :landingpages, :total_active_unique_links
    remove_column :landingpages, :landings_from_internal_links
    remove_column :landingpages, :landings_from_internal_search
    
    # bot activity stats
    remove_column :landingpages, :last_scan_by_google_1
    remove_column :landingpages, :last_scan_by_google_2
    remove_column :landingpages, :last_scan_by_google_3
    remove_column :landingpages, :last_scan_by_google_4
    remove_column :landingpages, :total_scans_by_google
    remove_column :landingpages, :total_days_between_scans_by_google
    remove_column :landingpages, :last_scan_by_yahoo_1
    remove_column :landingpages, :last_scan_by_yahoo_2
    remove_column :landingpages, :last_scan_by_yahoo_3
    remove_column :landingpages, :last_scan_by_yahoo_4
    remove_column :landingpages, :total_scans_by_yahoo
    remove_column :landingpages, :last_scan_by_other_1
    remove_column :landingpages, :last_scan_by_other_2
    remove_column :landingpages, :last_scan_by_other_3
    remove_column :landingpages, :total_scans_by_other
    
    # changes to sitemap data
    remove_column :landingpages, :previous_rank
    remove_column :landingpages, :previous_priority
    remove_column :landingpages, :previous_lastmod
    remove_column :landingpages, :previous_changefreq
  end
end
