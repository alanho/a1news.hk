# http://www.hkcd.com.hk/pdf/201209/0910/20120910.htm
module NewsSources
  class CommercialDaily < NewsSource
    source "hkcd"

    def is_available?
      !(noko_doc.nil?)
    end

    def date_string
      @date.strftime("%Y-%m-%d")
    end

    def source_image_url
      @source_image_url ||= (page_url + noko_doc.at("a[href$=pdf] img")["src"]).to_s
    end

    def link_url
      @link_url ||= page_url.to_s
    end

    private
    def noko_doc
      @noko_doc ||= Nokogiri::HTML(open(page_url).read.force_encoding("gbk").encode("utf-8")) rescue nil
    end

    def page_url
      URI(@date.strftime("http://www.hkcd.com.hk/pdf/%Y%m/%m%d/%Y%m%d.htm"))
    end
  end
end
