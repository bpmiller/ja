class AddActivityTotalsToLandingpages < ActiveRecord::Migration
  def self.up
    last activity on the landingpage
    add_column :landingpages, :last_scan, :datetime 
    add_column :landingpages, :last_scan_by, :string, :limit => 15
    add_column :landingpages, :last_landing, :datetime
    add_column :landingpages, :last_landing_type, :string, :limit => 1
    add_column :landingpages, :last_landing_by, :string, :limit => 15
    add_column :landingpages, :last_landing_keyword, :string, :limit => 25
    add_column :landingpages, :last_page_change, :datetime
    add_column :landingpages, :last_page_change_type, :string, :limit => 1 
    add_column :landingpages, :number_of_clicks_to_standard_links, :integer, :default =>0
    add_column :landingpages, :number_of_clicks_to_custom_links, :integer, :default =>0
    
    
    # html page content
    add_column :landingpages, :html_title, :string
    add_column :landingpages, :html_description, :string
    add_column :landingpages, :html_h1, :string
    add_column :landingpages, :html_meta_keywords, :string
    add_column :landingpages, :html_page_keywords, :string
    add_column :landingpages, :number_of_standard_links, :integer, :default =>0
    add_column :landingpages, :number_of_custom_links, :integer, :default =>0
    
    # landing page stats
    add_column :landingpages, :top_keyword, :string, :limit =>25
    add_column :landingpages, :top_keyword_counter, :integer, :default =>0
    add_column :landingpages, :second_keyword, :string, :limit =>25
    add_column :landingpages, :second_keyword_counter, :integer, :default =>0
    add_column :landingpages, :third_keyword, :string, :limit =>25
    add_column :landingpages, :third_keyword_counter, :integer, :default =>0
    add_column :landingpages, :total_unique_keywords, :integer, :default =>0
    
    add_column :landingpages, :landings_from_direct, :integer, :default => 0
    add_column :landingpages, :landings_from_google, :integer, :default => 0
    add_column :landingpages, :landings_from_yahoo, :integer, :default => 0
    add_column :landingpages, :landings_from_other_search_engines, :integer, :default => 0
    add_column :landingpages, :landings_from_facebook, :integer, :default => 0
    add_column :landingpages, :landings_from_twitter, :integer, :default => 0
    add_column :landingpages, :landings_from_mmlj_sites, :integer, :default => 0
    add_column :landingpages, :landings_from_colleges, :integer, :default => 0
    add_column :landingpages, :landings_from_k_thru_12, :integer, :default => 0
    add_column :landingpages, :landings_from_churches, :integer, :default => 0
    add_column :landingpages, :landings_from_other_referrals, :integer, :default => 0
  end

  def self.down
    remove_column :landingpages, :last_scan
    remove_column :landingpages, :last_scan_by
    remove_column :landingpages, :last_landing
    remove_column :landingpages, :last_landing_type
    remove_column :landingpages, :last_landing_by
    remove_column :landingpages, :last_landing_keyword
    remove_column :landingpages, :last_page_change
    remove_column :landingpages, :last_page_change_type
    remove_column :landingpages, :number_of_clicks_to_standard_links
    remove_column :landingpages, :number_of_clicks_to_custom_links


    # html page content
    remove_column :landingpages, :html_title
    remove_column :landingpages, :html_description
    remove_column :landingpages, :html_h1
    remove_column :landingpages, :html_meta_keywords
    remove_column :landingpages, :html_page_keywords
    remove_column :landingpages, :number_of_standard_links
    remove_column :landingpages, :number_of_custom_links

    # landing page stats
    remove_column :landingpages, :top_keyword
    remove_column :landingpages, :top_keyword_counter
    remove_column :landingpages, :second_keyword
    remove_column :landingpages, :second_keyword_counter
    remove_column :landingpages, :third_keyword
    remove_column :landingpages, :third_keyword_counter
    remove_column :landingpages, :total_unique_keywords

    remove_column :landingpages, :landings_from_direct
    remove_column :landingpages, :landings_from_google
    remove_column :landingpages, :landings_from_yahoo
    remove_column :landingpages, :landings_from_other_search_engines
    remove_column :landingpages, :landings_from_facebook
    remove_column :landingpages, :landings_from_twitter
    remove_column :landingpages, :landings_from_mmlj_sites
    remove_column :landingpages, :landings_from_colleges
    remove_column :landingpages, :landings_from_k_thru_12
    remove_column :landingpages, :landings_from_churches
    remove_column :landingpages, :landings_from_other_referrals
  end
end
