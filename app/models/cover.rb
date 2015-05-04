#encoding: utf-8

class Cover < ActiveRecord::Base
  has_attached_file :backup_image, styles: { thumb: '100x100#', medium: '350x200'}
  validates_attachment_content_type :backup_image, content_type: /\Aimage/
  #validates_attachment_file_name :backup_image, matches: [/png\Z/, /jpe?g\Z/, /data/, /gif/]

  validates_uniqueness_of :source, :scope => :date

  NEWS_NAMES = {
    "wenweipo" => "文匯報",
    "hkej" => "信報",
    "appledaily" => "蘋果日報",
    "takungpao" => "大公報",
    "hkcd" => "香港商報",
    "singpao" => "成報",
    "mingpao" => "明報",
    "oriental" => "東方日報",
    "thesun" => "太陽報",
    "metro" => "都巿日報",
    "headline" => "頭條日報",
    "am730" => "am730",
    "hket" => "經濟日報",
    "skypost" => "晴報",
  }

  def friendly_source_name
    NEWS_NAMES[source] || source
  end
end
