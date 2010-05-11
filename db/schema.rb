# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100510194626) do

  create_table "landingpages", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "lastmod"
    t.string   "changefreq"
    t.decimal  "priority",                                         :precision => 3, :scale => 1
    t.string   "sitemap"
    t.integer  "page_rank",                          :limit => 2,  :precision => 2, :scale => 0
    t.datetime "rank_updated_at"
    t.string   "page_type",                          :limit => 1,                                                   :null => false
    t.string   "page_trans",                         :limit => 4
    t.datetime "last_scan"
    t.string   "last_scan_by",                       :limit => 15
    t.datetime "last_landing"
    t.string   "last_landing_type",                  :limit => 1
    t.string   "last_landing_by",                    :limit => 15
    t.string   "last_landing_keyword",               :limit => 25
    t.datetime "last_page_change"
    t.string   "last_page_change_type",              :limit => 1
    t.integer  "number_of_clicks_to_standard_links",                                             :default => 0
    t.integer  "number_of_clicks_to_custom_links",                                               :default => 0
    t.string   "html_title"
    t.string   "html_description"
    t.string   "html_h1"
    t.string   "html_meta_keywords"
    t.string   "html_page_keywords"
    t.integer  "number_of_standard_links",                                                       :default => 0
    t.integer  "number_of_custom_links",                                                         :default => 0
    t.string   "top_keyword",                        :limit => 25
    t.integer  "top_keyword_counter",                                                            :default => 0
    t.string   "second_keyword",                     :limit => 25
    t.integer  "second_keyword_counter",                                                         :default => 0
    t.string   "third_keyword",                      :limit => 25
    t.integer  "third_keyword_counter",                                                          :default => 0
    t.integer  "total_unique_keywords",                                                          :default => 0
    t.integer  "landings_from_direct",                                                           :default => 0
    t.integer  "landings_from_google",                                                           :default => 0
    t.integer  "landings_from_yahoo",                                                            :default => 0
    t.integer  "landings_from_other_search_engines",                                             :default => 0
    t.integer  "landings_from_facebook",                                                         :default => 0
    t.integer  "landings_from_twitter",                                                          :default => 0
    t.integer  "landings_from_mmlj_sites",                                                       :default => 0
    t.integer  "landings_from_colleges",                                                         :default => 0
    t.integer  "landings_from_k_thru_12",                                                        :default => 0
    t.integer  "landings_from_churches",                                                         :default => 0
    t.integer  "landings_from_other_referrals",                                                  :default => 0
    t.integer  "bounces",                                                                        :default => 0
    t.integer  "total_links",                                                                    :default => 0
    t.integer  "total_active_links",                                                             :default => 0
    t.integer  "total_unique_links",                                                             :default => 0
    t.integer  "total_active_unique_links",                                                      :default => 0
    t.integer  "landings_from_internal_links",                                                   :default => 0
    t.integer  "landings_from_internal_search",                                                  :default => 0
    t.datetime "last_scan_by_google_1"
    t.datetime "last_scan_by_google_2"
    t.datetime "last_scan_by_google_3"
    t.datetime "last_scan_by_google_4"
    t.integer  "total_scans_by_google",                                                          :default => 0
    t.integer  "total_days_between_scans_by_google",                                             :default => 0
    t.datetime "last_scan_by_yahoo_1"
    t.datetime "last_scan_by_yahoo_2"
    t.datetime "last_scan_by_yahoo_3"
    t.datetime "last_scan_by_yahoo_4"
    t.integer  "total_scans_by_yahoo",                                                           :default => 0
    t.datetime "last_scan_by_other_1"
    t.datetime "last_scan_by_other_2"
    t.datetime "last_scan_by_other_3"
    t.integer  "total_scans_by_other",                                                           :default => 0
    t.integer  "previous_rank",                      :limit => 2,  :precision => 2, :scale => 0
    t.decimal  "previous_priority",                                :precision => 3, :scale => 1
    t.datetime "previous_lastmod"
    t.string   "previous_changefreq",                :limit => 7
    t.boolean  "top100",                                                                         :default => false
    t.integer  "top100_rank"
  end

  add_index "landingpages", ["page_type", "rank_updated_at"], :name => "index_landingpages_on_page_type_and_rank_updated_at"
  add_index "landingpages", ["url"], :name => "index_landingpages_on_url"

end
