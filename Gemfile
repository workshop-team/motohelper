# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.7'

gem 'administrate', '~> 0.8.1'
gem 'administrate-field-carrierwave', '~> 0.3'
gem 'administrate-field-select', '~> 2.1', require: 'administrate/field/select_basic'
gem 'bootstrap', '>= 4.3.1'
gem 'carrierwave', '~> 1.3.2'
gem 'carrierwave-i18n', '~> 0.2.0'
gem 'coffee-rails', '~> 4.2.2'
gem 'devise', '~> 4.7.1'
gem 'draper', '~> 3.0.1'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'friendly_id', '~> 5.2.3'
gem 'haml-rails', '~> 1.0.0'
gem 'httparty', '~> 0.15.6'
gem 'jbuilder', '~> 2.7.0'
gem 'jquery-rails', '~> 4.3.1'
gem 'kaminari', '~> 1.1.1'
gem 'mini_magick', '~> 4.9.4'
gem 'paranoia', '~> 2.4.0'
gem 'pg', '~> 0.21'
gem 'puma', '>= 3.12.2'
gem 'rails-i18n', '~> 5.0.4'
gem 'rollbar', '~> 2.15.5'
gem 'route_translator', '~> 5.5.3'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq', '~> 5.0.5'
gem 'simple_form', '~> 5.0.0'
gem 'skylight', '~> 1.5.1'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'whenever', '~> 0.10.0', require: false

group :development, :test do
  gem 'awesome_print', '~> 1.8.0'
  gem 'dotenv-rails', '~> 2.2.1'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'faker', '~> 1.8.7'
  gem 'haml_lint', '~> 0.27.0', require: false
  gem 'pry-byebug', '~> 3.5.1'
  gem 'rspec-rails', '~> 3.7.2'
end

group :development do
  gem 'capistrano', '~> 3.10.1'
  gem 'capistrano-bundler', '~> 1.3.0'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rails', '~> 1.3.1'
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'capistrano-scm-gitcopy', '~> 0.1.5'
  gem 'capistrano-sidekiq', '~> 1.0.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit', '~> 0.41.0', require: false
  gem 'rubocop', '~> 0.52.1', require: false
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner', '~> 1.6.2'
  gem 'rails-controller-testing', '~> 1.0.2'
  gem 'shoulda-matchers', '~> 3.1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
