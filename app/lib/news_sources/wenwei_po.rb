module NewsSources
  class WenweiPo < NewsSource
    source "wenweipo"

    def is_available?
      !(noko_doc.nil?)
    end

    def source_image_url
      @source_image_url ||= noko_doc.at("div.pdf_big.pdf_bgre a img")["src"]
    end

    def link_url
      @link_url ||= page_url
    end

    def headline
      @headline ||= begin
        page = 1
        begin
          url = @date.strftime("http://pdf.wenweipo.com/%Y/%m/%d/pdf#{page}.htm")
          doc = Nokogiri::HTML(open(url))
          
          headline = (doc.css(".pdf_c2br ul li")[0].text.strip rescue nil)
          page += 1
        end until !headline.nil? || page > 10

        headline
      end
    end

    private
    def noko_doc
      @noko_doc ||= Nokogiri::HTML(open(page_url)) rescue nil
    end

    def page_url
      @date.strftime("http://pdf.wenweipo.com/%Y/%m/%d/pdf1.htm")
    end
  end
end
