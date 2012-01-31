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
    content = body_p.to_s

    html = Document.create(title: title, author: author, description: description, pub_date: pub_date, format: format, content: content)

    f.close

    return html

  end
end
