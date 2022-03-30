# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

gem 'rails', '~> 6.1.5'
gem 'pg', '~> 1.3.4'
gem 'puma', '~> 5.6.4'
gem 'sass-rails', '~> 6.0.0'
gem 'uglifier', '~> 4.2.0'
gem 'bootsnap', '~> 1.11.1', require: false
gem 'rack-timeout', '~> 0.6.0'
gem 'hamlit', '~> 2.16.0'
gem 'bootstrap', '~> 5.1.3'
gem 'jquery-rails', '~> 4.4.0'
gem 'devise', '~> 4.8.1'
gem 'airbrake', '~> 13.0.0'

group :development, :test do
  gem 'pry', '~> 0.14.1'
  gem 'rspec-rails', '~> 5.1.1'
  gem 'factory_bot_rails', '~> 6.2.0'
end

group :development do
  gem 'rubocop', '~> 1.26.0', require: false
  gem 'rubocop-rails', '~> 2.14.0', require: false
  gem 'rubocop-performance', '~> 1.13.3', require: false
  gem 'rubocop-rspec', '~> 2.9.0', require: false
  gem 'haml_lint', '~> 0.40.0', require: false
  gem 'amazing_print', '~> 1.4.0'
end

group :test do
  gem 'shoulda-matchers', '~> 5.1.0'
end
