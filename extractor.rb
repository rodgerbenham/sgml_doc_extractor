require 'nokogiri'
require 'pry'

file = File.open("small", "r")
corpus = Nokogiri::XML(file)

docs = corpus.xpath("//DOC")

docs.each do |doc|
    doc_data = Nokogiri::XML.parse("<DOC>#{doc.inner_html}</DOC>")
    doc_no = doc_data.xpath('//DOCNO')
    headline = doc_data.xpath('//HEADLINE')
    text = doc_data.xpath('//TEXT')

    out_file = File.open("./output/#{doc_no.text.strip}", "w")
    out_file.write headline.text.strip
    out_file.write text.text.strip
end

