source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 3.4.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'enumerize', '~> 2.2'
gem 'devise', '~> 4.4.3'
gem 'devise_invitable', '~> 1.7.0'
gem 'cancancan', '~> 2.1'
gem 'refile', github: 'refile/refile', require: 'refile/rails'
gem 'refile-mini_magick', github: 'refile/refile-mini_magick'
gem 'refile-s3', '~> 0.2.0'
gem 'simple_form', '~> 4.0'
gem 'bootstrap-sass', '~> 3.3'
gem 'jquery-rails', '~> 4.3'
gem 'kaminari', '~> 1.1.1'
gem 'cocoon', '~>1.2.11'
gem 'select2-rails', '~>4.0.3'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver', '~> 3.11.0'
  gem 'pry-rails', '~> 0.3.6'
  gem 'pry-byebug', '~> 3.6.0'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'bullet', '~> 5.7.5'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rspec-rails', '~> 3.7.2'
  gem 'database_cleaner', '~> 1.6.2'
  gem 'dotenv-rails', '~> 2.2.1'
  gem 'ffaker', '~> 2.8.1'
  gem 'simplecov', '~> 0.16.1'
  gem 'vcr', '~> 4.0.0'
  gem 'webmock', '~> 3.3.0'
  gem 'dotenv', '~> 2.2'
end

group :test do
  gem 'rails-controller-testing', '~> 1.0.2'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener', '~> 1.6.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :staging, :production do
  gem 'rails_12factor', '~> 0.0.3'
end
