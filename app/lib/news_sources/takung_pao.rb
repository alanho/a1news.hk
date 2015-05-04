module NewsSources
  class TakungPao < NewsSource
    source "takungpao"

    def source_image_url
      noko_doc.at(".main-colum .coulum01_ct .books .frame a img")["src"]
    end

    def link_url
      page_url.to_s
    end

    def is_available?
      !noko_doc.nil?
    end

    def headline
      noko_doc.css("ul.txtlist li a")[0].text.strip
    end

    private
    def page_url
      URI(@date.strftime("http://news.takungpao.com.hk/paper/%Y%m%d.html"))
    end

    def noko_doc
      @noko_doc ||= (Nokogiri::HTML(open(page_url, redirect: false)) rescue nil)
    end
  end
end

