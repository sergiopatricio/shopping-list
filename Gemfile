# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.2'

gem 'amazing_print', '~> 1.8.1'
gem 'bootsnap', '~> 1.18.6', require: false
gem 'csv', '~> 3.3.4'
gem 'devise', '~> 4.9.4'
gem 'hamlit', '~> 3.0.3'
gem 'importmap-rails', '~> 2.1.0'
gem 'pg', '~> 1.5.9'
gem 'puma', '~> 6.6.0'
gem 'rack-timeout', '~> 0.7.0'
gem 'rails', '~> 8.0.2'
gem 'redis', '~> 5.4.0'
gem 'sprockets-rails', '~> 3.5.2'
gem 'stimulus-rails', '~> 1.3.4'
gem 'turbo-rails', '~> 2.0.13'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.4.4'
  gem 'pry', '~> 0.15.2'
  gem 'rspec-rails', '~> 8.0.0'
end

group :development do
  gem 'haml_lint', '~> 0.62.0', require: false
  gem 'rubocop', '~> 1.75.8', require: false
  gem 'rubocop-factory_bot', '~> 2.27.1', require: false
  gem 'rubocop-performance', '~> 1.25.0', require: false
  gem 'rubocop-rails', '~> 2.32.0', require: false
  gem 'rubocop-rspec', '~> 3.6.0', require: false
  gem 'rubocop-rspec_rails', '~> 2.31.0', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 6.5.0'
end
