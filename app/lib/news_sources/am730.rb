module NewsSources
  class Am730 < NewsSource
    source "am730"

    BASE_URL = URI("http://www.hkej.com/template/dailynews/jsp/toc_main.jsp")

    def date_string
      noko_doc.at('#date').text.scan(/[0-9]+/).join("-")
    end

    def headline
      noko_doc.css(".t6.f14")[1].text.strip
    end

    def source_image_url
      @source_image_url ||= begin
        img_href = noko_doc.at('#mini_news_img img')["src"]
        (URI("http://www.am730.com.hk/home") + img_href).to_s.gsub("/uploads/thumb.php?src=..","").gsub(/&.*$/,"")
      end
    end

    def link_url
      @link_url ||= page_url.to_s
    end

    def headline
      noko_doc.search('#top_list_box select.jumpOptions option[value]').first.text
    end

    private
    def page_url
      URI(@date.strftime("http://www.am730.com.hk/controller-setdate&date=%Y-%m-%d&backto=/home"))
    end

    def noko_doc
      @noko_doc ||= Nokogiri::HTML(open(page_url))
    end
  end
end
