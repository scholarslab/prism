class Prism < ActiveRecord::Base
  has_many :word_markings, :include => [:facet], :dependent => :delete_all
  belongs_to :users
  has_many :facets, :dependent => :delete_all
  attr_accessible :title, :author, :content, :num_words, :description, :user_id, :unlisted, :publication_date, :language, :license, :uuid
  validates_presence_of :title, :content, :license

# A prism is the document a user wishes other readers to interpret along particular facets.
# In other words, a prism is an uploaded text which a group of readers is expected to mark along pre-selected interpretive categories.
# A document, when uploaded, is split into an array consisting of individual words.

  self.primary_key ='uuid'

  before_create :set_uuid
  def set_uuid
    require 'uuidtools'
    self.uuid = UUIDTools::UUID.timestamp_create().to_s
  end

  def add_content_spans
    return if content.nil? or content.empty?
    return if title.nil?   or title.empty?
    return if license.nil? or license.empty?

    doc = Nokogiri::XML("")
    doc << doc.create_element("content")
    counter = 0

    content.each_line do |line|
      line.gsub!(/\A +/) { |m| "&nbsp;" * m.size }
      line.gsub!(/\t/)   { |m| "&nbsp;&nbsp;&nbsp;" }

      paragraph = doc.create_element("p")
      doc.root.add_child(paragraph)

      span_list = line.split(" ").map do |word|
        span = doc.create_element("span", :class => "word word_#{counter}")
        span << word + ' '
        counter += 1
        span
      end
      span_nodeset = Nokogiri::XML::NodeSet.new(doc, span_list)
      paragraph << span_nodeset
    end

    self.content   = doc.root.to_s
    self.num_words = counter
  end

end

