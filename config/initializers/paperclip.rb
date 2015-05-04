Paperclip::Attachment.default_options.update({
  :storage => :fog,
  :fog_credentials => {
    :provider => 'AWS',
    :aws_access_key_id => ENV['S3_ACCESS_ID'],
    :aws_secret_access_key => ENV['S3_ACCESS_KEY']
  },
  :fog_directory => "a1news-#{Rails.env}",
  :path => "/cover_backups/:id/:hash/:style",
  :fog_public => true,
  :hash_secret => ENV['PAPERCLIP_HASH_SECRET'] || "foobar"
}) if Rails.env.production?