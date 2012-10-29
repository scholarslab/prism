# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'coffeescript', :output => 'public/javascripts/compiled' do
  watch(/^app\/assets\/javascripts\/(.*).coffee/)
end

guard 'coffeescript', :output => 'spec/javascripts/compiled' do
  watch(/^spec\/javascripts\/unit\/(.*).coffee/)
end

guard 'livereload' do
  watch('^spec/javascripts/compiled/.+\.js$')
  watch('^public/javascripts/compiled/.+\.js$')
end
