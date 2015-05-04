module NewsSources
  class TheSun < NewsSource
    source "thesun"

    def is_available?
      !(noko_doc.nil?)
    end

    def source_image_url
      @source_image_url ||= (page_url + noko_doc.at('#tsnNewsCover #tsnCoverImg img')["src"]).to_s
    end

    def link_url
      @link_url ||= page_url.to_s
    end

    def headline
      noko_doc.at("#tsnNewsCover #tsnTitle a").text.strip
    end

    private
    def noko_doc
      @noko_doc ||= Nokogiri::HTML(open(page_url)) rescue nil
    end

    def page_url
      URI(@date.strftime("http://the-sun.on.cc/cnt/main/%Y%m%d/index.html"))
    end
  end
end
