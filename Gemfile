# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.5'

gem 'amazing_print', '~> 1.6.0'
gem 'bootsnap', '~> 1.18.4', require: false
gem 'devise', '~> 4.9.4'
gem 'hamlit', '~> 3.0.3'
gem 'importmap-rails', '~> 2.0.1'
gem 'pg', '~> 1.5.8'
gem 'puma', '~> 6.4.3'
gem 'rack-timeout', '~> 0.7.0'
gem 'rails', '~> 7.2.1'
gem 'redis', '~> 5.3.0'
gem 'sprockets-rails', '~> 3.5.2'
gem 'stimulus-rails', '~> 1.3.4'
gem 'turbo-rails', '~> 2.0.10'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.4.3'
  gem 'pry', '~> 0.14.2'
  gem 'rspec-rails', '~> 7.0.1'
end

group :development do
  gem 'haml_lint', '~> 0.58.0', require: false
  gem 'rubocop', '~> 1.66.1', require: false
  gem 'rubocop-factory_bot', '~> 2.26.1', require: false
  gem 'rubocop-performance', '~> 1.22.1', require: false
  gem 'rubocop-rails', '~> 2.26.2', require: false
  gem 'rubocop-rspec', '~> 3.0.5', require: false
  gem 'rubocop-rspec_rails', '~> 2.30.0', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 6.4.0'
end
