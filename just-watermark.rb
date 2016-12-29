images = Dir.glob("deploy/to-watermark/*.jpg")
images.each do |image|
  filename = File.basename(image)
  puts filename
  unless File.exists?("deploy/to-watermark/watermarked/#{filename}")
    system("composite -dissolve 100% -gravity southwest deploy/watermark-white-full.png #{image} deploy/to-watermark/watermarked/#{filename}")
  end
end

puts "watermarked images: #{images.length}"
