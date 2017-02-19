images = Dir.glob("*")

# 435 – twitter card
# 860 – open graph image / non-retina
# 1720 – site image
sizes = [1720, 860, 435]

images.keep_if{|i| i.end_with?('.jpg','.jpeg','.JPG','.JPEG','.gif','.GIF','.png')}

images.each do |image|
  sizes.each do |size|
    unless File.exists?("#{size}/#{image}")
      image_size = `convert #{image} -ping -format \"%w\" info:`
      if image_size.to_i > size
        puts "creating #{size}/#{image}"
        system("convert #{image} -resize '#{size}>' #{size}/#{image}")
      else
        #puts "not creating #{size}/#{image}, too small"
      end
    end
  end
end

puts "blog images: #{images.length}"
