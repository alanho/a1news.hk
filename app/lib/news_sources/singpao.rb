# http://www.hkcd.com.hk/pdf/201209/0910/20120910.htm
module NewsSources
  class Singpao < NewsSource
    source "singpao"

    def is_available?
      !(jumper_doc.nil?)
    end

    def source_image_url
      homepage = Nokogiri::HTML(open(homepage_url))

      img_href = homepage.at("div.mainbox.dzb h3 a img")["src"]

      @source_image_url ||= (homepage_url + img_href).to_s
    end

    def link_url
      @link_url ||= current_path.to_s
    end

    def current_path
      @current_path ||= begin
        page_url + jumper_doc.at('meta[http-equiv="refresh"]')['content'][/URL=(.+)/, 1]
      end
    end

    private
    def today_doc
      @today_doc ||= Nokogiri::HTML(open(current_path)) rescue nil
    end

    def jumper_doc
      @jumper_doc ||= Nokogiri::HTML(open(page_url)) rescue nil
    end

    def homepage_url
      URI("http://www.singpao.com")
    end

    def page_url
      URI(@date.strftime("http://www.singpao.com/cb/paper/%Y/%-m/%-d/"))
    end
  end
end
