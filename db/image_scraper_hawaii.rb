require 'open-uri'
require 'nokogiri'

board_href = []

PAGE = "https://www.hawaiisurf.com/snowboard/planches/"

html_doc = Nokogiri.HTML(open(PAGE))

html_doc.search('.product-row .box-bottom .master-lnk').each do |element|
  board_href << element.attribute('href').value
end

i = 1

board_href.each do |link|

  break if i == 31

  NEXTPAGE = "https://www.hawaiisurf.com/#{link}"

  html_doc = Nokogiri.HTML(open(NEXTPAGE))

  board_jpg = ''

  html_doc.search('.main-photo img').each do |element|
    board_jpg = element.attribute('src').value
  end

  p "#{i} - #{board_jpg}"

  download = open(board_jpg)
  IO.copy_stream(download, "../app/assets/images/bodyboards/bodyboard#{i}.jpg")

  i += 1
end

