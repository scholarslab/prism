source 'http://rubygems.org'

gem 'rails', '~>3.2.13'
# gem 'rails', github: 'rails/rails', branch: '3-2-stable'
gem "devise", "~> 2.0.0"

gem 'compass-rails', '~> 1.0.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'compass', git: 'https://github.com/chriseppstein/compass.git' # beta until release
  gem 'compass', '~> 0.12.1'
  #gem 'compass-rails', '~> 1.0.1'
  gem 'compass-susy-plugin', '~> 0.9'
  gem 'sass-rails'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'execjs', '1.3.0'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Error notifications
gem 'airbrake', '~> 3.1.6'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
#gem 'ruby-debug19', :require => 'ruby-debug'
#

group :production, :development do
  gem 'dalli', '~>1.0.5' # for memcached
end

group :development do
   #gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
   gem 'annotate',"2.4.1.beta1"
   gem "ffaker", "~> 1.8.1"
   # gem "rails-footnotes", "~> 3.7.5"
   gem "rails_best_practices"
   #gem "heroku", "~> 2.9.0"
   gem "nokogiri", "~> 1.5.0"
   # gem 'rails-dev-tweaks', '~> 0.5.1'
   # gem 'rails-dev-tweaks', '~> 0.5.1'
end

group :pgdev do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', "~> 1.3.4"
  gem "rspec-rails", "~> 2.8.0"
  gem "simplecov", "~> 0.5.4"
  gem "factory_girl_rails", "~> 1.3.0"
  gem "nyan-cat-formatter", "~> 0.0.3"
  gem "guard"
  gem "guard-coffeescript"
  gem 'forgery', '0.3.12'
end

group :test do
  gem 'turn', :require => false # Pretty printed test output
  gem "capybara", "~> 1.1.1"
  gem "spork", "~> 1.0rc"
  gem 'rake'
  gem 'database_cleaner'
  gem 'minitest'
  gem 'ruby-prof'
  gem "cucumber-rails"
  gem "jasmine"
  gem 'jasmine-jquery-rails'
end

group :production do
  #gem "heroku", "~>2.9.0"
  gem "pg"
  gem "thin" # use thin as the production server
 # gem "devise", "~> 2.0.0"
  gem "nokogiri", "~> 1.5.0"
  gem 'jasmine-jquery-rails'
  gem 'newrelic_rpm'
end
