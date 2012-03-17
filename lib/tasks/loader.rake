def count_words(text)
  text.split.length
end

def numberize(node, counter=0)
  node.children.each do |child|
    if child.text?
      words_list = child.to_s.split
      span_list = words_list.map do |word|
        span = node.document.create_element("span", word+' ', :class => "word_"+counter.to_s)
        counter += 1
        span
      end
      puts span_list[0].class
      span_nodeset = Nokogiri::XML::NodeSet.new(node.document, span_list)
      child.replace(span_nodeset)
    elsif child.element?
      counter = numberize(child, counter)
    end
  end
  counter
end

namespace :import do
  desc "Import the data from the files"
  task :docs => :environment do
    puts "Importing..."

    files = "./spec/fixtures/html"

    Dir["#{files}/*.html"].each do |file|
      record = builder(file)
      record.save
    end

  end

  def builder(file)

    f = File.open(file)
    doc = Nokogiri::HTML(f)

    title = doc.xpath("//head/title").text
    author = doc.xpath("//div[@id='bib']/div[@class='author']").text
    description = doc.xpath("//div[@id='bib']/div[@class='description']").text
    pub_date = doc.xpath("//div[@id='bib']/div[@class='pub_date']").text
    format = doc.xpath("//div[@id='bib']/div[@class='format']").text
    body_p = doc.xpath("//body/p")
    counter = 0
    body_p.each do |ptag|
      counter = numberize(ptag, counter)
    end
    content = body_p.to_s

    html = Document.create(title: title, author: author, description: description, pub_date: pub_date, format: format, content: content)

    f.close
    return html

  end
end
