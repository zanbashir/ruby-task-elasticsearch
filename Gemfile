source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby
ruby '2.6.6'

# Rails
gem 'rails', '~> 5.2.8'

# Databases
gem 'pg', '>= 0.18', '< 2.0'

# Web Servers
gem 'puma', '~> 3.11'

# Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# Javascripts
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'

# Authentication
gem 'devise'
gem 'doorkeeper'
gem 'oauth2', '~> 1.2'

# Serialization
gem 'active_model_serializers'

# Services
gem 'bootsnap', '>= 1.1.0', require: false
gem 'elasticsearch-rails'
gem 'elasticsearch-model'
gem  'elasticsearch', "< 7.14"
gem 'elasticsearch-persistence'
gem 'active_interaction'
gem "interactor"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'awesome_print'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
