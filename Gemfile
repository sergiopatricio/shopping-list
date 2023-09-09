# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', '~> 1.16.0', require: false
gem 'devise', '~> 4.9.2'
gem 'hamlit', '~> 3.0.3'
gem 'importmap-rails', '~> 1.2.1'
gem 'pg', '~> 1.5.4'
gem 'puma', '~> 6.3.1'
gem 'rack-timeout', '~> 0.6.3'
gem 'rails', '~> 7.0.7.2'
gem 'redis', '~> 5.0.7'
gem 'sprockets-rails', '~> 3.4.2'
gem 'stimulus-rails', '~> 1.2.2'
gem 'turbo-rails', '~> 1.4.0'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'pry', '~> 0.14.2'
  gem 'rspec-rails', '~> 6.0.3'
end

group :development do
  gem 'amazing_print', '~> 1.5.0'
  gem 'haml_lint', '~> 0.50.0', require: false
  gem 'rubocop', '~> 1.56.2', require: false
  gem 'rubocop-performance', '~> 1.19.0', require: false
  gem 'rubocop-rails', '~> 2.21.0', require: false
  gem 'rubocop-rspec', '~> 2.24.0', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 5.3.0'
end
