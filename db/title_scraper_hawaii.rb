require 'open-uri'
require 'nokogiri'
require 'csv'

board_title = []

PAGE = "https://www.hawaiisurf.com/bodyboard/planches/"

html_doc = Nokogiri.HTML(open(PAGE))

html_doc.search('.product-row .box-bottom .master-lnk').each do |element|
  board_title << element.text.strip
end

board_title.map! do |title|
    title.gsub("\n", ' - ')
end


csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
filepath    = 'bodyboards.csv'

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << board_title
end

# boards = []

# CSV.foreach(filepath) do |row|
#   boards = row
# end


# i = 1

# board_href.each do |link|

#   break if i == 31

#   NEXTPAGE = "https://www.hawaiisurf.com/#{link}"

#   html_doc = Nokogiri.HTML(open(NEXTPAGE))

#   board_jpg = ''

#   html_doc.search('.main-photo img').each do |element|
#     board_jpg = element.attribute('src').value
#   end

#   p "#{i} - #{board_jpg}"

#   download = open(board_jpg)
#   IO.copy_stream(download, "../app/assets/images/bodyboards/bodyboard#{i}.jpg")

#   i += 1
# end

