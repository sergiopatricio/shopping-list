# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.1'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 5.1.1'
gem 'sass-rails', '~> 6.0.0'
gem 'uglifier', '~> 4.2.0'
gem 'bootsnap', '~> 1.5.1', require: false
gem 'rack-timeout', '~> 0.6.0'
gem 'hamlit', '~> 2.14.1'
gem 'bootstrap', '~> 4.5.3'
gem 'jquery-rails', '~> 4.4.0'
gem 'devise', '~> 4.7.3'
gem 'airbrake', '~> 11.0.1'

group :development, :test do
  gem 'pry', '~> 0.13.1'
  gem 'rspec-rails', '~> 4.0.2'
  gem 'factory_bot_rails', '~> 6.1.0'
end

group :development do
  gem 'rubocop', '~> 1.8.0', require: false
  gem 'rubocop-rails', '~> 2.9.1', require: false
  gem 'rubocop-performance', '~> 1.9.2', require: false
  gem 'rubocop-rspec', '~> 2.1.0', require: false
  gem 'haml_lint', '~> 0.37.0', require: false
  gem 'amazing_print', '~> 1.2.2'
end

group :test do
  gem 'shoulda-matchers', '~> 4.4.1'
end
