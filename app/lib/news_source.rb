
class NewsSource
  class_attribute :source

  def self.source(src = nil)
    self.source = src if src
    self.source
  end

  def initialize(date = Time.now)
    @date = date
  end

  def collect
    if is_available?
      Cover.create({
        :date => @date.to_date,
        :headline => headline,
        :backup_image => backup_image,
        :image_url => image_url,
        :source_image_url => source_image_url,
        :source => source,
        :link_url => link_url,
        :status => "okay"
      })
    end
  end

  def backup_image
    URI(image_url)
  end

  def is_available?
    date_string == @date.strftime("%Y-%m-%d")
  end

  def headline
    nil
  end

  def source_image_url
    raise NotImplementedError
  end

  def image_url
    source_image_url # default bypass
  end

  def date_string
    @date.strftime("%Y-%m-%d")
  end

  def link_url
    raise NotImplementedError
  end

  def source
    self.class.source
  end
end