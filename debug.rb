Earthquake.init do
  output do |item|
    # puts item.to_json
  end

  command :arg_debug do |m|
    puts m.inspect
  end

  output do |item|

  end
end
