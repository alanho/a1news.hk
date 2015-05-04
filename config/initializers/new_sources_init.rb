Dir.glob(File.expand_path("app/lib/news_sources/**/*.rb", Rails.root)).each do |model_file|
  require model_file
end