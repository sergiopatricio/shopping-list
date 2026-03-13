# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.9'

gem 'amazing_print', '~> 2.0.0'
gem 'bootsnap', '~> 1.23.0', require: false
gem 'csv', '~> 3.3.5'
gem 'devise', '~> 5.0.2'
gem 'hamlit', '~> 4.0.0'
gem 'importmap-rails', '~> 2.2.3'
gem 'pg', '~> 1.6.3'
gem 'puma', '~> 7.2.0'
gem 'rack-timeout', '~> 0.7.0'
gem 'rails', '~> 8.1.2'
gem 'redis', '~> 5.4.1'
gem 'sprockets-rails', '~> 3.5.2'
gem 'stimulus-rails', '~> 1.3.4'
gem 'turbo-rails', '~> 2.0.23'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.5.1'
  gem 'pry', '~> 0.16.0'
  gem 'rspec-rails', '~> 8.0.4'
end

group :development do
  gem 'haml_lint', '~> 0.72.0', require: false
  gem 'rubocop', '~> 1.85.1', require: false
  gem 'rubocop-factory_bot', '~> 2.28.0', require: false
  gem 'rubocop-performance', '~> 1.26.1', require: false
  gem 'rubocop-rails', '~> 2.34.3', require: false
  gem 'rubocop-rspec', '~> 3.9.0', require: false
  gem 'rubocop-rspec_rails', '~> 2.32.0', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 7.0.1'
end
