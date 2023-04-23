# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', '~> 1.16.0', require: false
gem 'devise', '~> 4.9.2'
gem 'hamlit', '~> 3.0.3'
gem 'importmap-rails', '~> 1.1.5'
gem 'pg', '~> 1.4.6'
gem 'puma', '~> 6.2.2'
gem 'rack-timeout', '~> 0.6.3'
gem 'rails', '~> 7.0.4'
gem 'redis', '~> 5.0.6'
gem 'sprockets-rails', '~> 3.4.2'
gem 'stimulus-rails', '~> 1.2.1'
gem 'turbo-rails', '~> 1.4.0'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'pry', '~> 0.14.1'
  gem 'rspec-rails', '~> 6.0.1'
end

group :development do
  gem 'amazing_print', '~> 1.4.0'
  gem 'haml_lint', '~> 0.45.0', require: false
  gem 'rubocop', '~> 1.50.2', require: false
  gem 'rubocop-performance', '~> 1.17.1', require: false
  gem 'rubocop-rails', '~> 2.19.1', require: false
  gem 'rubocop-rspec', '~> 2.20.0', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 5.3.0'
end
