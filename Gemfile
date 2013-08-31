source 'https://rubygems.org'

gem 'rails', '4.0.0'

# Core Stuff
gem 'sqlite3'
gem 'jquery-rails'
gem 'turbolinks'
gem "compass-rails", "~> 2.0.alpha.0"
gem 'sass-rails', '~> 4.0.0'
gem 'zurb-foundation', '~> 4.0.0'

group :assets do 
  gem 'uglifier', '>= 1.3.0'
end

group :development do
  gem 'guard-rspec'
  gem 'guard-rails'
  gem 'guard-spork'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'jasmine-rails'
end

group :test do
  gem 'capybara'
  gem 'shoulda'
  gem 'launchy'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Feature Gems
gem 'devise'
