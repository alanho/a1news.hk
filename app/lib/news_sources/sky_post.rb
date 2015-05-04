# http://epaper.skypost.hk/fileData/ePapers/20121030/1719572364/files/assets/pages/page0044.swf?rnd=64d1e5f032a90bad4f92ccf393f6c1ec

module NewsSources
  class SkyPost < NewsSource
    source "skypost"

    BASE_URL = URI("http://www.skypost.hk/epaper")

    def date_string
      link_url[/(?<=\/ePapers\/)[0-9]+/]
    end

    def is_available?
      date_string == @date.strftime("%Y%m%d")
    end

    def source_image_url
      # http://epaper.skypost.hk/fileData/ePapers/20150504/1009237532/files/assets/flash/pages/page0001_l.jpg
      @source_image_url ||= "http://epaper.skypost.hk/fileData/ePapers/#{link_url[/(?<=\/ePapers\/)([0-9]+\/[0-9]+\/)/]}files/assets/flash/pages/page0001_l.jpg"
    end

    def link_url
      @link_url ||= noko_doc.at(".C_Middle_Content .CoverALL .CoverMain .CoverMPic a")["href"][/http:\/\/[^']+/]
    end

    def headline
      archive_doc.css(".TodayArtLine a")[0].text.strip
    end

    def archive_url
      "http://skypost.hk/archive/#{@date.strftime("%Y%m%d")}/"
    end

    def archive_doc
      @archive_doc ||= Nokogiri::HTML(open(archive_url, "User-Agent" => "Googlebot/2.1"))
    end

    private
    def noko_doc
      @noko_doc ||= Nokogiri::HTML(open(BASE_URL))
    end
  end
end
