  base_url = "http://www.northshorecity.govt.nz/Foodgrading/foodgrading_search.asp"
  puts "Base URL: #{base_url}"
  content = `curl --no-keepalive #{base_url}`
  doc = Hpricot(content)
  suburbs = (doc/"select[@name='suburb'] option")
  suburbs = suburbs.map{|opt| opt['value']}.find_all{|opt| opt.strip.length > 0}
  
  url = "http://www.northshorecity.govt.nz/Foodgrading/foodgrading_search.asp?"
  suburbs.each{|s|
    url += "&suburb=" + CGI::escape(s)
  }
  #puts "Search URL: #{url}"
  s_doc = Hpricot(open(url))
  puts (s_doc/"table:nth-of-type(1) th:nth-of-type(0)").text
  n_pages = (s_doc/"table:nth-of-type(1) th:nth-of-type(0)").text.match(/of (\d+)/)[1].to_i
  
  page_urls = []
  (1..n_pages).each{|pageNo|
    page_urls << url + "&page=#{pageNo}"
  }
  puts "Got #{page_urls.length} pages of data to grab"
  
  entries = []
  page_urls[0,10].each{|p_url|
    puts p_url
    p_doc = Hpricot(open(p_url))
    (p_doc/"table.results td.leftMost a").each{|link_elem|
      e_url = "http://www.northshorecity.govt.nz/Foodgrading/" + link_elem['href']
      e_id = link_elem['href'].match(/id=(\d+)/)[1].to_i
      e_name = link_elem.inner_text.strip
      entries << {'id'=>e_id, 'url'=>e_url, 'description'=>e_name} if e_id
    }
  }

