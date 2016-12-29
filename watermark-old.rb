images = Dir.glob("*")

# 435 – twitter card
# 860 – open graph image / non-retina
# 1720 – site image
sizes = [1720, 860, 435, 380]
images.keep_if{|i| i.end_with?('.jpg','.jpeg','.JPG','.JPEG','.gif','.GIF','.png')}

images.each do |image|
  unless File.exists?("watermarked/#{image}")
    system("composite -dissolve 100% -gravity southwest deploy/watermark-white.png #{image} watermarked/#{image}")
  end

  unless File.exists?("watermarked/square/#{image}")
    system("composite -dissolve 100% -gravity southwest deploy/watermark-white.png square/#{image} watermarked/square/#{image}")
  end

  sizes.each do |size|
    unless File.exists?("watermarked/#{size}/#{image}")
      system("composite -dissolve 100% -gravity southwest deploy/watermark-white-#{size}.png #{size}/#{image} watermarked/#{size}/#{image}")
    end
  end
end

puts "watermarked images: #{images.length}"
