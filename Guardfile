# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'coffeescript', :output => 'public/javascripts/compiled' do
  watch(/^app\/assets\/javascripts\/(.*).coffee/)
end

guard 'coffeescript', :output => 'spec/javascripts/compiled' do
  watch(/^spec\/javascripts\/unit\/(.*).coffee/)
end

=begin
guard 'livereload' do
  watch(/^spec\/javascripts\/compiled\/.+\.js$/)
  watch(/^public\/javascripts\/compiled\/.+\.js$/)
end
=end

guard :shell do
  watch(/.*\.js$/)  { `rake spec SPEC=spec/features/` }
  watch(/.*\.erb$/) { `rake spec SPEC=spec/features/` }
  watch(/.*\.rb$/)  { `rake spec SPEC=spec/features/` }
end
