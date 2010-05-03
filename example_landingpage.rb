class Landingpage
  attr_accessor :url, :title, :meta_description, :meta_keywords, :h1, :page_description, 
  :last_priority,      :last_date_submitted,     :last_change_frequency, 
  :previous_priority,  :previous_date_submitted, :previous_change_frequency,
  :prepre_priority,    :prepre_date_submitted,   :prepre_change_frequency,
  :total_scans,        :total_landings,
  :last_scan_google,   :previous_scan_google,    :total_google_scans,  :total_days_between_google_scans,
  :last_direct_visist, :previous_direct_visit,   :total_direct_visits, :total_days_between_direct_visits,
  :last_referral,      :previous_referral,       :total_referrals,     :total_days_between_referrals, :total_unique_links, :total_edu_links
  :last_google_search, :previous_google_search,  :total_searches_google, :total_days_between_google_searches, :last_keyword, :previous_keyword, :prepre_keyword
  def initialize(attributes = {})
    @url  = attributes[:url]
    @title = attributes[:title]
  end

  # def formatted_email
  #   "#{@name} <#{@email}>"
  # end
end
  