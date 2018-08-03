require 'open-uri'
require 'nokogiri'

rider_src = []
rider_name = []

PAGE = "http://streetleague.com/pros"

html_doc = Nokogiri.HTML(open(PAGE))

html_doc.search('.portfolio-item-holder img').each do |element|
  rider_src << element.attribute('src').value
end

html_doc.search('.pro-name').each do |element|
  rider_name << element.text.strip
end

rider_name.map! do |name|
  name.gsub(' ', '-').downcase
end

# i = 0

rider_src.each_with_index do |link, i|

  # break if i == 31

  p "#{i} - #{rider_name[i]}"

  download = open(link)
  IO.copy_stream(download, "../app/assets/images/riders/#{rider_name[i]}.jpg")

  # i += 1
end

