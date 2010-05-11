# == Schema Information
# Schema version: 20100510194626
#
# Table name: landingpages
#
#  id                                 :integer(4)      not null, primary key
#  url                                :string(255)
#  title                              :string(255)
#  created_at                         :datetime
#  updated_at                         :datetime
#  lastmod                            :datetime
#  changefreq                         :string(255)
#  priority                           :decimal(3, 1)
#  sitemap                            :string(255)
#  page_rank                          :integer(2)
#  rank_updated_at                    :datetime
#  page_type                          :string(1)       not null
#  page_trans                         :string(4)
#  last_scan                          :datetime
#  last_scan_by                       :string(15)
#  last_landing                       :datetime
#  last_landing_type                  :string(1)
#  last_landing_by                    :string(15)
#  last_landing_keyword               :string(25)
#  last_page_change                   :datetime
#  last_page_change_type              :string(1)
#  number_of_clicks_to_standard_links :integer(4)      default(0)
#  number_of_clicks_to_custom_links   :integer(4)      default(0)
#  html_title                         :string(255)
#  html_description                   :string(255)
#  html_h1                            :string(255)
#  html_meta_keywords                 :string(255)
#  html_page_keywords                 :string(255)
#  number_of_standard_links           :integer(4)      default(0)
#  number_of_custom_links             :integer(4)      default(0)
#  top_keyword                        :string(25)
#  top_keyword_counter                :integer(4)      default(0)
#  second_keyword                     :string(25)
#  second_keyword_counter             :integer(4)      default(0)
#  third_keyword                      :string(25)
#  third_keyword_counter              :integer(4)      default(0)
#  total_unique_keywords              :integer(4)      default(0)
#  landings_from_direct               :integer(4)      default(0)
#  landings_from_google               :integer(4)      default(0)
#  landings_from_yahoo                :integer(4)      default(0)
#  landings_from_other_search_engines :integer(4)      default(0)
#  landings_from_facebook             :integer(4)      default(0)
#  landings_from_twitter              :integer(4)      default(0)
#  landings_from_mmlj_sites           :integer(4)      default(0)
#  landings_from_colleges             :integer(4)      default(0)
#  landings_from_k_thru_12            :integer(4)      default(0)
#  landings_from_churches             :integer(4)      default(0)
#  landings_from_other_referrals      :integer(4)      default(0)
#  bounces                            :integer(4)      default(0)
#  total_links                        :integer(4)      default(0)
#  total_active_links                 :integer(4)      default(0)
#  total_unique_links                 :integer(4)      default(0)
#  total_active_unique_links          :integer(4)      default(0)
#  landings_from_internal_links       :integer(4)      default(0)
#  landings_from_internal_search      :integer(4)      default(0)
#  last_scan_by_google_1              :datetime
#  last_scan_by_google_2              :datetime
#  last_scan_by_google_3              :datetime
#  last_scan_by_google_4              :datetime
#  total_scans_by_google              :integer(4)      default(0)
#  total_days_between_scans_by_google :integer(4)      default(0)
#  last_scan_by_yahoo_1               :datetime
#  last_scan_by_yahoo_2               :datetime
#  last_scan_by_yahoo_3               :datetime
#  last_scan_by_yahoo_4               :datetime
#  total_scans_by_yahoo               :integer(4)      default(0)
#  last_scan_by_other_1               :datetime
#  last_scan_by_other_2               :datetime
#  last_scan_by_other_3               :datetime
#  total_scans_by_other               :integer(4)      default(0)
#  previous_rank                      :integer(2)
#  previous_priority                  :decimal(3, 1)
#  previous_lastmod                   :datetime
#  previous_changefreq                :string(7)
#  top100                             :boolean(1)
#  top100_rank                        :integer(4)
#

class Landingpage < ActiveRecord::Base
  attr_accessor :url, :title# , :meta_description, :meta_keywords, :h1, :page_description, 
  #   :last_priority,      :last_date_submitted,     :last_change_frequency, 
  #   :previous_priority,  :previous_date_submitted, :previous_change_frequency,
  #   :prepre_priority,    :prepre_date_submitted,   :prepre_change_frequency,
  #   :total_scans,        :total_landings,
  #   :last_scan_google,   :previous_scan_google,    :total_google_scans,  :total_days_between_google_scans,
  #   :last_direct_visist, :previous_direct_visit,   :total_direct_visits, :total_days_between_direct_visits,
  #   :last_referral,      :previous_referral,       :total_referrals,     :total_days_between_referrals, :total_unique_links, :total_edu_links
  #   :last_google_search, :previous_google_search,  :total_searches_google, :total_days_between_google_searches, :last_keyword, :previous_keyword, :prepre_keyword

  validates_presence_of :url, :title


end
