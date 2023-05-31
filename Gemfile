# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'pg', '~> 1.3.4'
gem 'rails', '~> 7.0.4'

gem 'bootsnap', require: false
gem 'jsonapi-serializer', '~> 2.2'
gem 'puma', '~> 5.0'
gem 'rest-client', '~> 2.1'
gem 'sidekiq', '~> 6.5'
gem 'sidekiq-cron', '~> 1.10', '>= 1.10.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'virtus', '~> 1.0'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rswag-specs'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'solargraph'
end

group :test do
  gem 'database_cleaner'
  gem 'vcr', '~> 6.1.0'

  # Stub HTTP requests
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov'
  gem 'webmock', '~> 3.9.1'
end
