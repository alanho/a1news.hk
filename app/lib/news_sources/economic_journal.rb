module NewsSources
  class EconomicJournal < NewsSource
    source "hkej"

    def is_available?
      !noko_doc.at("#toc-top #toc_top_menu #toc_top_menu_left_bg a img").nil?
    end

    def source_image_url
      @source_image_url ||= (page_url + noko_doc.at("#toc-top #toc_top_menu #toc_top_menu_left_bg a img")["src"]).to_s
    end

    def link_url
      "http://www1.hkej.com/dailynews/toc?date=#{@date.strftime("%Y-%m-%d")}"
    end

    def headline
      noko_doc.css("#toc-top table tr:first ul:first li:first")[0].text.strip rescue nil
    end

    private
    def page_url
      URI(@date.strftime("http://www1.hkej.com/dailynews/toc?date=%Y-%m-%d"))
    end

    def noko_doc
      @noko_doc ||= Nokogiri::HTML(open(page_url))
    end
  end
end
