#http://www.hket.com/eti/epaper/20120917
module NewsSources
  class EconomicTimes < NewsSource
    source "hket"

    def is_available?
      !noko_doc.search(".eti-epaper-menu-daily").empty?
    end

    def source_image_url
      @source_image_url ||= (page_url + a_section_node.search("a").last.at("img")["src"]).to_s
    end

    def link_url
      @link_url ||= (page_url + a_section_node.at("a")["href"][/\/[a-zA-Z0-9\/]+/]).to_s
    end

    private
    def noko_doc
      @noko_doc ||= Nokogiri::HTML(open(page_url)) rescue nil
    end

    def a_section_node
      noko_doc.search(".eti-epaper-menu-daily").first
    end

    def page_url
      URI(@date.strftime("http://www.hket.com/eti/epaper/%Y%m%d"))
    end
  end
end
