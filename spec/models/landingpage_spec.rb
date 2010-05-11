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

require 'spec_helper'

describe Landingpage do
  before(:each) do
    @attr = {
      :url => "/bible/verse/john_3:16\?version=/",
      :title => "John 3:8 NIV - Bible Verse - Just1Word Online Bible"
    }
  end

  it "should create a new instance given valid attributes" do
    Landingpage.create!(@attr)
  end
  it "should require a URL" do
    no_url = Landingpage.new(@attr.merge(:url=>""))
    no_url.should_not be_valid
  end
  it "should require a title" do
    no_title = Landingpage.new(@attr.merge(:title=>""))
    no_title.should_not be_valid
  end

end
