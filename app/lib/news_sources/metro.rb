#http://www.readmetro.com/en/china/hong-kong/download/20120913/
module NewsSources
  class Metro < NewsSource
    source "metro"

    def source_image_url
      @source_image_url ||= begin
        page.at(".issue-header .location-name a")["href"]
      end 
    end

    def link_url
      @link_url ||= @date.strftime("http://www.readmetro.com/en/china/hong-kong/%Y%m%d/")
    end

    def is_available?
      !page.at(".issue-header .location-name a").nil?
    end

    def headline
      pda_doc.at(".firstArticle .header").text.strip
    end

    private
    def pda_url
      "http://www.metrohk.com.hk/pda/pda.php?section=daily&categoryID=all&selectedDate=#{@date.strftime("%Y-%m-%d")}"
    end

    def pda_doc
      @index_doc ||= Nokogiri::HTML(open(pda_url, "User-Agent" => "Googlebot/2.1"))
    end

    def page 
      @page ||= Nokogiri::HTML(open(page_url, :read_timeout => 600))
    end

    def page_url
      # http://www.readmetro.com/en/china/hong-kong/20150430/
      URI(@date.strftime("http://www.readmetro.com/en/china/hong-kong/%Y%m%d/"))
    end
  end
end
