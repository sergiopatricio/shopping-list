# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'airbrake', '~> 13.0.2'
gem 'bootsnap', '~> 1.11.1', require: false
gem 'devise', '~> 4.8.1'
gem 'hamlit', '~> 2.16.0'
gem 'jquery-rails', '~> 4.5.0'
gem 'pg', '~> 1.3.5'
gem 'puma', '~> 5.6.4'
gem 'rack-timeout', '~> 0.6.0'
gem 'rails', '~> 7.0.3'
gem 'sprockets-rails', '~> 3.4.2'
gem 'uglifier', '~> 4.2.0'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'pry', '~> 0.14.1'
  gem 'rspec-rails', '~> 5.1.2'
end

group :development do
  gem 'amazing_print', '~> 1.4.0'
  gem 'haml_lint', '~> 0.40.0', require: false
  gem 'rubocop', '~> 1.30.0', require: false
  gem 'rubocop-performance', '~> 1.14.0', require: false
  gem 'rubocop-rails', '~> 2.14.2', require: false
  gem 'rubocop-rspec', '~> 2.11.1', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 5.1.0'
end
