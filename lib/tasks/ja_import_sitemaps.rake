require 'zlib' 
require 'open-uri'
require 'pp'
require 'google-pr'

@book=["bible","gen","exo","lev","num","deu","jos","jdg","rut","1sa","2sa","1ki","2ki","1ch","2ch","ezr","neh","est","job","psa","pro","ecc","son","isa","jer","lam","eze","dan","hos","joe","amo","oba","jon","mic","nah","hab","zep","hag","zec","mal","mat","mar","luk","joh","act","rom","1co","2co","gal","eph","php","col","1th","2th","1ti","2ti","tit","phm","heb","jam","1pe","2pe","1jo","2jo","3jo","jud","rev"]

# def elapsedTime(start_time)
#   elapsed_time = Time.now - start_time
#   days = (elapsed_time/60/60/24).floor
#   elapsed_time -= days*60*60*24
#   hours = (elapsed_time/60/60).floor
#   elapsed_time -= hours*60*60
#   mins = (elapsed_time/60).floor
#   elapsed_time -= mins*60
#   secs = elapsed_time.floor
#   puts "Elapsed time: #{days} days, #{hours} hours, #{mins} minutes, #{secs} seconds"
# end

def sitemaps(all, test)
  if test=="true"
    maps=["sitemap.xml.gz"]
  else
    maps=["sitemap.xml.gz", "sitemap/amp.xml.gz", "sitemap/esv.xml.gz", "sitemap/kjv.xml.gz", "sitemap/lbla.xml.gz", "sitemap/msg.xml.gz", "sitemap/nasb.xml.gz", "sitemap/nblh.xml.gz", "sitemap/ncv.xml.gz", "sitemap/niv.xml.gz", "sitemap/nkjv.xml.gz", "sitemap/nlt.xml.gz", "sitemap/nvi.xml.gz", "sitemap/searches.xml.gz", "sitemap/topics.xml.gz" ]
  end
  # maps=["sitemap/topics.xml.gz"]
  # puts "        Sitemap               Rows  \n"  
  # puts "-------------------------   ------  \n"  

  @landingpages=Array.new
  pages=Array.new
  while maps.length>0
    @uri=maps.shift
    @source = open("http://www.just1word.com/"+@uri)
    @gz = Zlib::GzipReader.new(@source) 
    @result = @gz.read
    @result.gsub!(/\n +/,'')
    @result.gsub!(/<url>/,"\n<url>")
    # a=/<\?xml.*/.match(@result)
    # # puts a
    @result.gsub!(/<\?xml.*/,'')
    @result.gsub!(/<\/?urlset.*\n?\>?/,'')
    @result.gsub!(/\n\n/,'')
    @result.gsub!(/^\n<url>/,'<url>')
    @result.gsub!(/\n>\n/,'')
    @result.gsub!(/<\/priority><\/url>/,"</priority><sitemap>#{@uri}</sitemap></url>")
    pages=@result.split("\n")
    @landingpages = @landingpages+ pages
    puts "#{sprintf "%25s", @uri}  #{sprintf "%7d", pages.length}   \n"
  end
  return @landingpages
end

namespace :ja do

  desc "(Re)Imports a delimited file of sitemap data."

  task :import_sitemaps => :environment do
    
    if ENV["RUN"].nil? then      
        raise "You must specify a RUN option (RUN=initial or RUN=update)."
    elsif (ENV["RUN"].downcase != "initial") and (ENV["RUN"].downcase != "update") 
        raise "Invalid RUN option -- valid options:  RUN=initial or RUN=update"
    end
    if ENV["TEST"].nil? then      
        raise "You must specify a TEST option (TEST=true or TEST=false)."
    elsif (ENV["TEST"].downcase != "true") and (ENV["TEST"].downcase != "false") 
        raise "Invalid TEST option -- valid options:  TEST=true or TEST=false"
    end

    start=Time.now
    puts "Start time: #{start}"
    puts "Step 1. Gathering Sitemaps..."
    sitemaps("all", ENV["TEST"])
    puts "                          --------"
    puts "#{sprintf "%25s", " "}  #{sprintf "%7d", @landingpages.length}   \n"
    # elaspedTime(start)
    p=DateTime.now
    if ENV["RUN"].downcase == "initial"
      puts "Step 3. Purging file and loading sitemaps..."
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE landingpages")
      i=0
      batch=1000
      counter=batch
      tpages=@landingpages.length
      while @landingpages.length>0
        mline=@landingpages.shift
        url=mline.match(/<loc>(.*)<\/loc><lastmod>(.*)<\/lastmod><changefreq>(.*)<\/changefreq><priority>(.*)<\/priority><sitemap>(.*)<\/sitemap>/)
        if url[1].length<24
          ur=url[1]
        else
          ur=url[1][24..2000]
        end
        ActiveRecord::Base.connection.execute("INSERT INTO landingpages (url, title, lastmod, changefreq, priority, created_at, updated_at, sitemap) VALUES (#{ur.dump}, '', #{url[2].dump}, #{url[3].dump}, #{url[4].dump}, \"#{p}\", \"#{p}\", #{url[5].dump})")
        i += 1
        if i == counter
          per=i*100.00/tpages
          etime=Time.now-start
          initialelapsed=etime
          estimate=initialelapsed/(per/100.00)-initialelapsed
          ehours = (estimate/60/60).floor
          estimate -= ehours*60*60
          emins = (estimate/60).floor
          estimate -= emins*60
          esecs = estimate.floor
          puts "Landingpage # #{i} of #{tpages} done (#{sprintf "%.2f", per}%)  #{ur[0..25].dump}   Estimated remaining time: #{sprintf "%2d", ehours}:#{sprintf "%02d", emins}:#{sprintf "%02d", esecs}"
          counter += batch
        end
      end
    else

      # put RUN=update code here to check each record in the sitemaps and update fields or add records
      #
      #
      class Landingpage < ActiveRecord::Base
          attr_accessible :url, :lastmod, :changefreq, :priority, :sitemap
      end      
      puts "Changes since the last update...\n"
      i=0
      changes=0
      tpages=@landingpages.length
      while @landingpages.length>0
        mline=@landingpages.shift
        url=mline.match(/<loc>(.*)<\/loc><lastmod>(.*)<\/lastmod><changefreq>(.*)<\/changefreq><priority>(.*)<\/priority><sitemap>(.*)<\/sitemap>/)
        if url[1].length<24
          ur=url[1]
        else
          ur=url[1][24..2000]
        end
        if ur.length<2
          ur="/"
        end
        # puts mline

        page = Landingpage.find(:first, :conditions => "url = \"#{ur}\"")

        if page.nil?
          ActiveRecord::Base.connection.execute("INSERT INTO landingpages (url, title, lastmod, changefreq, priority, created_at, updated_at, sitemap) VALUES (#{ur.dump}, '', #{url[2].dump}, #{url[3].dump}, #{url[4].dump}, \"#{p}\", \"#{p}\", #{url[5].dump})")
          puts "#{changes}. #{ur} Not Found -- Record added."
          changes +=1
        else
          # puts "URL: #{ur} vs #{page.url}  Lastmod: #{url[2][0..9]} / #{page.lastmod.to_s[0..9]}  Changefreq: #{url[3]} / #{page.changefreq}   Priority: #{url[4]} / #{page.priority}"
          if url[2][0..9] != page.lastmod.to_s[0..9]
            puts "#{changes}. #{page.url} warning 'lastmod' is different J1W: #{page.lastmod}  Google: #{url[2]}"
            changes +=1
          end
          if url[3] != page.changefreq
            puts "#{changes}. #{page.url} warning 'changefreq' is different J1W: #{page.changefreq} Google: #{url[3]}"
            page.save!
          end
          if url[4].to_s != page.priority.to_s
            puts "#{changes}. #{page.url}  warning 'priority' is different J1W:  #{page.priority} Google: #{url[4]}"
            changes +=1
          end
          if url[5] != page.sitemap
            puts "#{changes}. #{page.url}  warning 'sitemap' is different J1W: #{page.sitemap} Google: #{url[5]}"
            changes +=1
          end
        end
        i += 1
        if i == counter
          per=i*100.00/tpages
          etime=Time.now-start
          initialelapsed=etime
          estimate=initialelapsed/(per/100.00)-initialelapsed
          ehours = (estimate/60/60).floor
          estimate -= ehours*60*60
          emins = (estimate/60).floor
          estimate -= emins*60
          esecs = estimate.floor
          puts "Landingpage # #{i} of #{tpages} done (#{sprintf "%.2f", per}%)  #{ur[0..25].dump}   Estimated remaining time: #{sprintf "%2d", ehours}:#{sprintf "%02d", emins}:#{sprintf "%02d", esecs}"
          counter += batch
        end
      end
    end
    if changes = 0
      puts "No changes.\n"
    end
    etime=Time.now-start
    hours = (etime/60/60).floor
    etime -= hours*60*60
    mins = (etime/60).floor
    etime -= mins*60
    secs = etime.floor
    puts "Elasped time: #{sprintf "%2d", hours}:#{sprintf "%02d", mins}:#{sprintf "%02d", secs}"

    puts "SEO:GooglePR for www.just1word.com (#{SEO::GooglePR.new("www.just1word.com").page_rank})"

  end
end