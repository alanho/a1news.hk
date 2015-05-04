namespace :a1news do
  desc "Collect News Sources"
  task collect: :environment do
    force = ENV["FORCE"]
    as_of = ENV["HOURSAGO"].to_i.hours.ago || Time.now

    NewsSource.subclasses.each do |newsource|
      begin
        # Only get new stuff after 5am
        puts "--- #{newsource.source} ---"
        if force || Cover.where(:date => 5.hours.ago.to_date, :source => newsource.source).empty?
          puts "Processing #{newsource.source} either because force is on or not found in DB"
          
          newsource.new(as_of).tap do |source|
            if source.is_available?
              puts "#{newsource.source} feed found"
              source.collect
            else
              puts "#{newsource.source} feed not found"
            end
          end
        end
      rescue Exception => ex
        # what should i do?!?
      end
    end
  end

end
