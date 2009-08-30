require 'hpricot'
require 'open-uri'

desc "Index: Auckland City Food Ratings"
task :auckland => :environment do
    # first find the available suburbs
    base_url = "http://www.aucklandcity.govt.nz/council/services/foodsearch/default.asp"
    puts "Base URL: #{base_url}"
    doc = Hpricot(open(base_url))
    suburbs = (doc/"#mainSectionContentArea select[@name='pSuburb'] option[@value]")
    suburbs = suburbs.map{|opt| opt['value']}.find_all{|opt| opt.strip.length > 0}
    
    base_search_url = "http://www.aucklandcity.govt.nz/council/services/foodsearch/"
    page_urls = []
    suburbs.each{|s| 
        puts s
        s_url = base_search_url + "default.asp?status=go&pSuburb=" + CGI::escape(s)
        s_doc = Hpricot(open(s_url))
        pages = (s_doc/"td.pageNumbers a").each{ |pageHref|
            p_url = base_search_url + pageHref['href']
            page_urls << p_url
        }
    }
    puts "Got #{page_urls.length} pages of data to grab"
    
    entries = []
    page_urls.each{|p_url|
        #puts p_url
        p_doc = Hpricot(open(p_url))
        (p_doc/"#mainSectionContentArea table:nth-of-type(1) a").each{|link_elem|
            e_url = base_search_url + link_elem['href']
            e_id = link_elem['href'].match(/pFoodGradeID=(\d+)/)[1].to_i
            e_name = link_elem.inner_text.strip
            entries << {'id'=>e_id, 'url'=>e_url, 'description'=>e_name} if e_id
        }
    }
    return entries
end
