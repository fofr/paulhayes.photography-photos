require 'fileutils'

# 435 – twitter card
# 860 – open graph image / non-retina
# 1720 – site image
sizes = [1720, 860, 435, 380]

images = Dir.glob("*.jpg")
images.keep_if{|i| i.end_with?('.jpg','.jpeg','.JPG','.JPEG','.gif','.GIF','.png')}

def watermark_image(image, output_path)
  unless File.exists?(output_path)
    image_width = `convert #{image} -ping -format \"%w\" info:`
    image_height = `convert #{image} -ping -format \"%h\" info:`

    if (image_height > image_width)
      maximum_watermark_width = Integer(Integer(image_width) * 0.4) # 40% of image width
    else
      maximum_watermark_width = Integer(Integer(image_width) * 0.2) # 20% of image width
    end

    puts output_path
    system("composite -dissolve 100% -gravity southwest \\\( deploy/watermark-white.png -resize #{maximum_watermark_width} \\\) #{image} #{output_path}")
  end
end

images.each do |image|
  filename = File.basename(image)
  watermark_image(image, "watermarked/#{filename}")
  watermark_image("square/#{image}", "watermarked/square/#{filename}")

  sizes.each do |size|
    watermark_image("#{size}/#{image}", "watermarked/#{size}/#{filename}")
  end
end

puts "watermarked images: #{images.length}"
