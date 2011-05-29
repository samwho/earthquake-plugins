Earthquake.init do
  def self.format_trends(trends)
    if trends.nil?
      error "Invalid parameter passed to format_trends: nil."
    elsif trends.has_key? 'error'
      error trends["error"]
    end

    to_return = "Trends on Twitter as of #{trends["as_of"]}\n"
    trends["trends"].each do |trend|
      to_return << "  #{trend["name"].coloring(nil, 32)} - #{trend["url"].coloring(nil, 31)}\n"
    end

    return to_return
  end

  command :trends do
    puts format_trends(twitter.trends)
  end

  command :trends_available do
    puts "Country list for :trends_for_location. Use the ID, e.g. :trends_for_location 1 for Worldwide trends."
    twitter.trends_available.each do |place|
      puts "\tID #{place["woeid"]}: #{place["name"]} (#{place["country"].coloring(nil, config[:color][:info])})"
    end
  end

  command :trends_for_location do |m|
    puts format_trends(twitter.trends_for_location(m[1].to_i))
  end
end
