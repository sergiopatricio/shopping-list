# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.2'

gem 'amazing_print', '~> 1.6.0'
gem 'bootsnap', '~> 1.18.3', require: false
gem 'devise', '~> 4.9.4'
gem 'hamlit', '~> 3.0.3'
gem 'importmap-rails', '~> 2.0.1'
gem 'pg', '~> 1.5.6'
gem 'puma', '~> 6.4.2'
gem 'rack-timeout', '~> 0.7.0'
gem 'rails', '~> 7.1.3'
gem 'redis', '~> 5.2.0'
gem 'sprockets-rails', '~> 3.4.2'
gem 'stimulus-rails', '~> 1.3.3'
gem 'turbo-rails', '~> 2.0.5'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.4.3'
  gem 'pry', '~> 0.14.2'
  gem 'rspec-rails', '~> 6.1.2'
end

group :development do
  gem 'haml_lint', '~> 0.58.0', require: false
  gem 'rubocop', '~> 1.64.1', require: false
  gem 'rubocop-performance', '~> 1.21.0', require: false
  gem 'rubocop-rails', '~> 2.25.0', require: false
  gem 'rubocop-rspec', '~> 2.29.2', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 6.2.0'
end
