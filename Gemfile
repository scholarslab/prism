source 'https://rubygems.org'

ruby "2.2.0"

gem 'will_paginate', '~> 3.0'
gem 'rails', '~> 4.2.1'
# gem 'rails', github: 'rails/rails', branch: '3-2-stable'

gem 'bcrypt-ruby', '~> 3.1.0'
gem "devise", "~> 3.4.0"

gem 'omniauth'
gem 'omniauth-oauth2', '~> 1.2'

gem 'omniauth-google'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem 'omniauth-browserid'

gem 'activerecord-deprecated_finders'

gem 'puma'

gem "uuidtools"

gem "language_list"
gem 'cancan'

# Error notifications
#gem 'airbrake', '~> 4.1.0'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem "nokogiri", "~> 1.6"

gem 'activerecord-import'

# page caching
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'

# Gems used only for assets and not required
# in production environments by default.

gem 'compass', '~> 1.0.3'
gem 'compass-rails', '~> 2.0.4'
gem 'susy', '~> 2.2.2'
#gem 'compass-susy-plugin', '~> 0.9'
gem 'sass-rails'
gem 'coffee-rails', '~> 4.1.0'
#gem 'execjs', '1.3.0'
gem 'uglifier', '>= 1.0.3'

gem 'actionpack-xml_parser'

group :production, :staging, :development do
  gem 'dalli', '~>2.7.4' # for memcached
  gem 'memcachier', "~> 0.0.2"
  #gem "unicorn"
end

group :development do
  gem 'annotate',"2.6.8"
  gem "ffaker"
  gem "rails_best_practices"
  gem 'figaro'
  gem "foreman"
end

group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails", "~> 3.2.1"
  gem "simplecov", "~> 0.9.2"
  gem "factory_girl_rails", "~> 4.5.0"
  #gem "nyan-cat-formatter", "~> 0.11"
  gem "guard"
  #gem "guard-coffeescript"
  gem 'forgery', '0.6'

  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'turn', :require => false # Pretty printed test output
  gem "capybara", "~> 2.4.4"
  #gem "spork", "~> 1.0rc"
  gem 'rake'
  gem 'database_cleaner'
  gem 'minitest'
  gem 'ruby-prof'
  gem "cucumber-rails", :require => false
  gem "jasmine"
  gem 'jasmine-jquery-rails'
end

group :production, :staging do
  gem "mysql2"
  gem "pg"
  gem 'newrelic_rpm'
end
