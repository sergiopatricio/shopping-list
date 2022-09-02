# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', '~> 1.12.0', require: false
gem 'devise', '~> 4.8.1'
gem 'hamlit', '~> 2.16.0'
gem 'importmap-rails', '~> 1.1.4'
gem 'pg', '~> 1.4.1'
gem 'puma', '~> 5.6.4'
gem 'rack-timeout', '~> 0.6.3'
gem 'rails', '~> 7.0.3'
gem 'redis', '~> 4.7.1'
gem 'sprockets-rails', '~> 3.4.2'
gem 'stimulus-rails', '~> 1.0.4'
gem 'turbo-rails', '~> 1.1.1'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'pry', '~> 0.14.1'
  gem 'rspec-rails', '~> 5.1.2'
end

group :development do
  gem 'amazing_print', '~> 1.4.0'
  gem 'haml_lint', '~> 0.40.0', require: false
  gem 'rubocop', '~> 1.31.2', require: false
  gem 'rubocop-performance', '~> 1.14.2', require: false
  gem 'rubocop-rails', '~> 2.15.2', require: false
  gem 'rubocop-rspec', '~> 2.12.1', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 5.1.0'
end
