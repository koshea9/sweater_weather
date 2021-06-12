source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem "figaro"

group :development, :test do
  gem 'capybara'
  gem "factory_bot_rails"
  gem 'faker'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'simplecov', require: false
  gem 'shoulda-matchers', '~> 4.0'
  gem 'pry'
end

group :development do
  gem 'listen', '~> 3.3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
