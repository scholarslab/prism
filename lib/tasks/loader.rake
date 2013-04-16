class String
  def to_bool
    return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end

def count_words(text)
  text.split.length
end

def numberize(node, counter=0)
  node.children.each do |child|
    if child.text?
      words_list = child.to_s.split
      span_list = words_list.map do |word|
        span = node.document.create_element("span", :class => "word word_"+counter.to_s)
        span << word
        span << ' '
        counter += 1
        span
      end
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
      doc, prism, facets = builder(file)
      doc.save()
      prism.save()
      for facet in facets
        facet.save()
      end
    end
  end
  
  desc "Delete all prisms, documents, markings, and facets"
  task :clear => :environment do
    Prism.delete_all()
    Document.delete_all()
    Marking.delete_all()
    Facet.delete_all()
  end

  def builder(file)

    f = File.open(file)
    doc = Nokogiri::HTML(f)

    title = doc.xpath("//head/title").inner_html
    author = doc.xpath("//div[@id='bib']/div[@class='author']").text
    description = doc.xpath("//div[@id='bib']/div[@class='description']").text
    pub_date = doc.xpath("//div[@id='bib']/div[@class='pub_date']").text
    format = doc.xpath("//div[@id='bib']/div[@class='format']").text
    facet_tags = doc.css("div#facets div.facet")
    prompt = doc.xpath("//div[@id='bib']/div[@class='prompt']").text
    sandbox = doc.xpath("//div[@id='bib']/div[@class='sandbox']").text.to_bool
    body_p = doc.xpath("//body/p")

    counter = 0
    for ptag in body_p
      counter = numberize(ptag, counter)
    end
    content = body_p.to_s

    html = Document.create(title: title, author: author, description: description, pub_date: pub_date, format: format, sandbox: sandbox, content: content, num_words:counter)
    prism = Prism.create(prompt: prompt, document: html, title: title, author: author, content: content, num_words: counter, sandbox: sandbox, description: description )
    facets = []

    for facet_data in facet_tags
      color = facet_data.css("div.color").text
      category = facet_data.css("div.category").text
      facet = Facet.create(color: color, category: category, prism: prism)
      facets.push(facet)
    end
    f.close
    return [html, prism, facets]

  end
end
