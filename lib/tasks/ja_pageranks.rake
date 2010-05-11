require 'zlib' 
require 'open-uri'
require 'pp'
require 'google-pr'

namespace :ja do

  desc "(Re)Imports a delimited file of sitemap data."

  task :pageranks => :environment do
    
    if ENV["TYPE"].nil? then      
      raise "TYPE must be specified as TYPE=b (b=books, c=chapters, v=verses, t=topics, k=keywords, p=passage, s=search, y=story, r=version, m=main pages)\n\nShould be---> rake ja:pageranks TYPE=v  TRANS=niv  UPDATERANKS=no  TOP=yes  PROCESS=no       \n"
    else 
      if ENV["TYPE"].downcase.match(/b|c|v|t|k|p|s|y|r|m|all/).nil? 
        raise "\nInvalid TRANS -- valid options:  TYPE=b or b=books, c=chapters, v=verses, t=topics, k=keywords, p=passage, s=search, y=story, r=version, m=main pages\n\nShould be---> rake ja:pageranks TYPE=v  TRANS=niv  UPDATERANKS=no  TOP=yes  PROCESS=no       \n"
      end
    end
    if ENV["TOP"].nil? then      
      raise "TOP must be specified as TOP=yes or TOP=no\n\nShould be---> rake ja:pageranks TYPE=v  TRANS=niv  UPDATERANKS=no  TOP=yes  PROCESS=no       \n"
    elsif (ENV["TOP"].downcase !="yes") and (ENV["TOP"].downcase != "no") 
      raise "Invalid TOP option -- valid options:  TOP=yes or TOP=no\n\nShould be---> rake ja:pageranks TYPE=v  TRANS=niv  UPDATERANKS=no  TOP=yes  PROCESS=no       \n"
    end
    if ENV["UPDATERANKS"].nil? then      
      raise "UPDATERANKS must be specified as UPDATERANKS=yes, other or no\n\nShould be---> rake ja:pageranks TYPE=v  TRANS=niv  UPDATERANKS=no  TOP=yes  PROCESS=no       \n"
    elsif (ENV["UPDATERANKS"].downcase != "yes") and (ENV["UPDATERANKS"].downcase != "no") and (ENV["UPDATERANKS"].downcase != "other") 
      raise "Invalid UPDATERANKS -- valid options:  UPDATERANKS=yes, other or UPDATERANKS=no\n\nShould be---> rake ja:pageranks TYPE=v  TRANS=niv  UPDATERANKS=no  TOP=yes  PROCESS=no       \n"
    end
    if ENV["TRANS"].nil? then      
      raise "TRANS must be specified as TRANS=niv, nasb, esv, nlt, nkjv, kjv, amp, lbla, nblh, nvi, ncv, msg, all\n\nShould be---> rake ja:pageranks TYPE=v  TRANS=niv  UPDATERANKS=no  TOP=yes  PROCESS=no       \n"
    else
      if ENV["TRANS"].downcase.match(/niv|nasb|esv|nlt|nkjv|kjv|amp|lbla|nblh|nvi|ncv|msg|all/).nil? 
        raise "Invalid TRANS -- valid options:  TRANS=niv, nasb, esv, nlt, nkjv, kjv, amp, lbla, nblh, nvi, ncv, msg, all\n\nShould be---> rake ja:pageranks TYPE=v  TRANS=niv  UPDATERANKS=no  TOP=yes  PROCESS=no       \n"
      end
    end
    if ENV["PROCESS"].nil? then      
      raise "PROCESS must be specified as PROCESS=yes or PROCESS=no (whether you want updates processed and pageranks on Google updated).\n\nShould be---> rake ja:pageranks TYPE=v  TRANS=niv  UPDATERANKS=no  TOP=yes  PROCESS=no       \n"
    elsif (ENV["PROCESS"].downcase != "yes") and (ENV["PROCESS"].downcase != "no") 
      raise "Invalid PROCESS -- valid options: PROCESS=yes or PROCESS=no\n\nShould be---> rake ja:pageranks TYPE=v  TRANS=niv  UPDATERANKS=no  TOP=yes  PROCESS=no       \n"
    end

    start=Time.now
    puts "\n\nStart time: #{start}"
    # elaspedTime(start)
    # put RUN=update code here to check each record in the sitemaps and update fields or add records
    #
    #
    class Landingpage < ActiveRecord::Base
       attr_accessible :url, :lastmod, :changefreq, :priority, :pagerank, :rank_updated_at
    end
    if ENV["UPDATERANKS"].downcase == "yes"
      updateranks="DATE(rank_updated_at)<DATE(CURDATE())"
    else
      if ENV["UPDATERANKS"].downcase=="no"
        updateranks="rank_updated_at IS null"
      else
        updateranks=""
      end
    end
    if ENV["TOP"].downcase == "yes"
      top100=" AND top100=true"
    else
      top100=""
    end
    if updateranks==""
      conditions="page_type=\"#{ENV['TYPE']}\" #{top100}"
    else
      conditions="page_type=\"#{ENV['TYPE']}\" AND #{updateranks} #{top100}"
    end
    if ENV["TRANS"].downcase != "all"
      conditions = conditions+ " AND url LIKE \"%version=#{ENV['TRANS']}%\""
    end
    puts "conditions: #{conditions}"
    pages = Landingpage.find(:all, :conditions => "#{conditions}");

    puts "\nFetched #{pages.length} pages with TYPE=#{ENV['TYPE']} TRANS=#{ENV['TRANS']} UPDATERANKS=#{ENV['UPDATERANKS']} PROCESS=#{ENV['PROCESS']} TOP=#{ENV['TOP']}\n\n"
    tv=0
    vrs=0
    chp=0
    if ENV['TOP']=="yes"
      puts "TOP VERSES"
    end
    if ENV["PROCESS"].downcase == "no"
      puts "Change-----> PROCESS=yes to lookup ranks on GOOGLE and update landingpages.\n\n"
    else
      i=0
      changes=0
      tpages=pages.length
      while i<pages.length
        if ENV['UPDATERANKS']=='other'
          # pageverse=pages[i].url.match(/\/bible\/verse\/(.*)\?version/)
          # if pageverse
          #   vrs+=1
          #   if pages[i].top100
          #     if pages[i].page_trans=="lbla" or pages[i].page_trans=="nblh" or pages[i].page_trans=="nvi"
          #       rank=@top_verses_es.index(pageverse[1])+1
          #     else
          #       rank=@top_verses_en.index(pageverse[1])+1
          #     end
          #     puts "#{pageverse[1]} #{pages[i].page_trans}  Popularity rank: #{rank}"
          #     pages[i].top100_rank=rank
          #     changes +=1
          #     pages[i].save!
          #     tv+=1
          #   end
          # end
        else
          pageverse=pages[i].url.match(/\/bible\/verse\/(.*)\?version/)
          if pageverse
            vrs+=1
            if pages[i].top100
              rank=SEO::GooglePR.new("www.just1word.com"+pages[i].url).page_rank
              if rank != pages[i].page_rank
                puts "#{pageverse[1]} #{pages[i].page_trans}  New google rank: #{rank}   was #{pages[i].page_rank}"
                pages[i].page_rank=rank
                changes +=1
              else
                puts "#{pageverse[1]} #{pages[i].page_trans}  Same rank: #{rank}"
              end
              pages[i].rank_updated_at=Time.now.strftime("%Y-%m-%d %H:%M:%S")
              pages[i].save!
              tv+=1
            end
          end
        end
        if (ENV['TYPE']=="c")
          pagechp=pages[i].url.match(/\/bible\/verse\/(.*)\?version/)
          if pagechp
            chp+=1
            rank=SEO::GooglePR.new("www.just1word.com"+pages[i].url).page_rank
            if rank != pages[i].page_rank
              # puts "url: #{pages[i].url}  lastmod: #{pages[i].lastmod}  changefreq: #{pages[i].changefreq} priority: #{pages[i].priority}  pagerank: #{pages[i].pagerank}"
              puts "#{pagechp[1]} #{pages[i].page_trans} New google rank: \"#{rank}\"   was \"#{pages[i].page_rank}\""
              pages[i].page_rank=rank
              changes +=1
            else
              puts "#{pagechp[1]} #{pages[i].page_trans} Same rank: \"#{rank}\""
            end
            pages[i].rank_updated_at=Time.now.strftime("%Y-%m-%d %H:%M:%S")
            pages[i].save!
            tc+=1
          end
        end
        i +=1
      end
    end
    if changes==0
      puts "No new pageranks.   Top verses=#{tv}    Verses=#{vrs}  Chapters= #{chp}"
    else
      puts "#{changes} changes.   Top verses=#{tv}    Verses=#{vrs}   Chapters= #{chp}"
    end
    etime=Time.now-start
    hours = (etime/60/60).floor
    etime -= hours*60*60
    mins = (etime/60).floor
    etime -= mins*60
    secs = etime.floor
    puts "Elasped time: #{sprintf "%2d", hours}:#{sprintf "%02d", mins}:#{sprintf "%02d", secs}"
  end
end