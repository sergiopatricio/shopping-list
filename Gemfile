# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '~> 6.1.4.4'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 5.5.2'
gem 'sass-rails', '~> 6.0.0'
gem 'uglifier', '~> 4.2.0'
gem 'bootsnap', '~> 1.9.3', require: false
gem 'rack-timeout', '~> 0.6.0'
gem 'hamlit', '~> 2.15.1'
gem 'bootstrap', '~> 5.1.3'
gem 'jquery-rails', '~> 4.4.0'
gem 'devise', '~> 4.8.1'
gem 'airbrake', '~> 12.0.0'

group :development, :test do
  gem 'pry', '~> 0.14.1'
  gem 'rspec-rails', '~> 5.0.2'
  gem 'factory_bot_rails', '~> 6.2.0'
end

group :development do
  gem 'rubocop', '~> 1.24.0', require: false
  gem 'rubocop-rails', '~> 2.13.0', require: false
  gem 'rubocop-performance', '~> 1.13.0', require: false
  gem 'rubocop-rspec', '~> 2.7.0', require: false
  gem 'haml_lint', '~> 0.37.1', require: false
  gem 'amazing_print', '~> 1.4.0'
end

group :test do
  gem 'shoulda-matchers', '~> 5.1.0'
end
