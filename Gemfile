# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.9'

gem 'amazing_print', '~> 2.0.0'
gem 'bootsnap', '~> 1.18.6', require: false
gem 'csv', '~> 3.3.5'
gem 'devise', '~> 4.9.4'
gem 'hamlit', '~> 3.0.3'
gem 'importmap-rails', '~> 2.2.2'
gem 'pg', '~> 1.6.2'
gem 'puma', '~> 7.0.4'
gem 'rack-timeout', '~> 0.7.0'
gem 'rails', '~> 8.0.3'
gem 'redis', '~> 5.4.1'
gem 'sprockets-rails', '~> 3.5.2'
gem 'stimulus-rails', '~> 1.3.4'
gem 'turbo-rails', '~> 2.0.17'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.5.1'
  gem 'pry', '~> 0.15.2'
  gem 'rspec-rails', '~> 8.0.2'
end

group :development do
  gem 'haml_lint', '~> 0.66.0', require: false
  gem 'rubocop', '~> 1.81.1', require: false
  gem 'rubocop-factory_bot', '~> 2.27.1', require: false
  gem 'rubocop-performance', '~> 1.26.0', require: false
  gem 'rubocop-rails', '~> 2.33.4', require: false
  gem 'rubocop-rspec', '~> 3.7.0', require: false
  gem 'rubocop-rspec_rails', '~> 2.31.0', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 6.5.0'
end
