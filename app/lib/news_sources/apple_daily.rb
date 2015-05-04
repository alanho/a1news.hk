module NewsSources
  class AppleDaily < NewsSource
    source "appledaily"

    BASE_URL = URI("http://hk.apple.nextmedia.com/")

    def date_string
      is_image_found? ? @date.strftime("%Y-%m-%d") : "0000-00-00"
    end

    def source_image_url
      today_image_path
    end

    def link_url
      "http://hk.apple.nextmedia.com/archive/index/#{@date.strftime("%Y%m%d")}/index/"
    end

    def is_image_found?
      open(today_image_path)
      true
    rescue
      false
    end

    def headline
      index_doc.css(".ArchiveContainerLHS ul:first li")[0].text.strip
    end

    private
    def index_doc
      @index_doc ||= Nokogiri::HTML(open(link_url, "User-Agent" => "Googlebot/2.1"))
    end

    def noko_doc
      @noko_doc ||= Nokogiri::HTML(open(BASE_URL, "User-Agent" => "Googlebot/2.1"))
    end

    def today_image_path
      "http://static.apple.nextmedia.com/images/apple-photos/apple/#{@date.strftime("%Y%m%d")}/head/head_4104.jpg"
    end
  end
end
