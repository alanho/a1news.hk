module NewsSources
  class Mingpao < NewsSource
    source "mingpao"

    def is_available?
      !(noko_doc.at(".headline .right a h1").nil?)
    end

    def source_image_url
      @source_image_url ||= (page_url + noko_doc.at(".inbox a img.lazy")["src"]).to_s
    end

    def link_url
      @link_url ||= page_url.to_s
    end

    def headline
      noko_doc.at(".headline .right a h1").text.strip
    end

    private
    def page_url
      URI("http://news.mingpao.com/pns/%E8%A6%81%E8%81%9E/web_tc/section/#{@date.strftime("%Y%m%d")}/s00001")
    end

    def noko_doc
      @noko_doc ||= Nokogiri::HTML(open(page_url).read.force_encoding("UTF-8"))
    end
  end
end
