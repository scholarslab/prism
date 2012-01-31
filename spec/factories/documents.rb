# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :document do |document|
  document.title "Test Document"
  document.author "Author McAuthor"
  document.pub_date 1
  document.description "Description."
  document.format "Book"
  document.content "Poesy."
end
