When /^I visit the "([^"]*)" homepage$/ do |lang|
  if lang == 'French'
    locale = 'fr'
  elsif lang == 'English'
    locale = 'en'
  elsif lang == 'Spanish'
    locale = 'es'
  elsif lang == 'German'
    locale = 'de'
  end

  visit('/' + "?locale=" + locale)
end

Then /^the header should have the words ([a-z]*|[A-Z]*)/ do |desc|
  page.should have_content(desc)
end
