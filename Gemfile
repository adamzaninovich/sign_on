source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem "thin", ">= 1.4.1"

gem 'warden', '~> 1.2.1'

gem 'jquery-rails'
gem "haml", ">= 3.1.7"
gem "bootstrap-sass", ">= 2.1.0.0"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg', '~> 0.14.1'
end

group :development do
  gem 'sqlite3'
  gem "haml-rails", ">= 0.3.5"
  gem "hpricot", ">= 0.8.6"
  gem "ruby_parser", ">= 2.3.1" 
  gem "hub", ">= 1.10.2", :require => nil
end

group :development, :test do
  gem "rspec-rails", ">= 2.11.0"
  gem "factory_girl_rails", ">= 4.0.0"
end

group :test do
  gem "capybara", ">= 1.1.2"
  gem "email_spec", ">= 1.2.1"
end
