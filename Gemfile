source 'https://rubygems.org'

gem 'rails', '4.0.0'

# Core Stuff
gem 'sqlite3'
gem 'jquery-rails'
gem 'turbolinks'

group :assets do 
  gem 'sass-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
end

group :development do
  gem 'guard-rspec'
  gem 'guard-rails'
  gem 'guard-spork'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
end

group :test do
  gem 'capybara'
  gem 'jasmine'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Feature Gems
gem 'devise'
