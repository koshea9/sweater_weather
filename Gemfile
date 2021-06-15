source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'faraday'
gem 'fast_jsonapi'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'bcrypt', '~> 3.1.7'


group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'figaro'
  gem 'pry'
  gem 'rspec-rails', '~> 5.0.0'
end

group :test do
  gem 'faker'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'listen', '~> 3.3'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
