# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '4.0.6'

gem 'amazing_print', '~> 3.0.0'
gem 'bootsnap', '~> 1.26.2', require: false
gem 'csv', '~> 3.3.7'
gem 'devise', '~> 5.0.4'
gem 'hamlit', '~> 4.0.0'
gem 'importmap-rails', '~> 2.2.3'
gem 'pg', '~> 1.7.0'
gem 'puma', '~> 8.1.2'
gem 'rack-timeout', '~> 0.7.0'
gem 'rails', '~> 8.1.3'
gem 'redis', '~> 6.0.0'
gem 'sprockets-rails', '~> 3.5.2'
gem 'stimulus-rails', '~> 1.3.4'
gem 'turbo-rails', '~> 2.0.23'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.5.1'
  gem 'pry', '~> 0.16.1'
  gem 'rspec-rails', '~> 8.1.0'
end

group :development do
  gem 'haml_lint', '~> 0.78.0', require: false
  gem 'rubocop', '~> 1.92.3', require: false
  gem 'rubocop-factory_bot', '~> 2.28.0', require: false
  gem 'rubocop-performance', '~> 1.27.0', require: false
  gem 'rubocop-rails', '~> 2.38.0', require: false
  gem 'rubocop-rspec', '~> 3.10.2', require: false
  gem 'rubocop-rspec_rails', '~> 2.33.0', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 8.0.1'
end
