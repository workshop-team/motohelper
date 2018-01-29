# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Views
gem 'bootstrap', '~> 4.0.0.beta3'
gem 'draper'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'haml-rails', '~> 1.0'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'simple_form'

# Default locales
gem 'rails-i18n', '~> 5.0.0'

# Engine
gem 'administrate'
gem 'administrate-field-carrierwave', '~> 0.2.0'
gem 'administrate-field-select', '~> 2.0', require: 'administrate/field/select_basic'
gem 'carrierwave', '~> 1.0'
gem 'carrierwave-i18n'
gem 'devise'
gem 'friendly_id'
gem 'httparty', '~> 0.15.6'
gem 'paranoia', '~> 2.2'

gem 'sidekiq'
gem 'whenever', require: false

# Error reporting
gem 'rollbar'

group :development, :test do
  gem 'awesome_print'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'haml_lint', require: false
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.6'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-scm-gitcopy'
  gem 'capistrano-sidekiq'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit', '~> 0.41.0', require: false
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
