source "https://rubygems.org"

ruby "2.3.0"

gem "rails", "4.2.3"
gem "pg"

# assets
gem "autoprefixer-rails"
gem "coffee-rails"
gem "foundation-icons-sass-rails"
gem "foundation-rails"
gem "jquery-rails"
gem "sass-rails", "~> 5.0.0"
gem "skim", git: "https://github.com/jfirebaugh/skim"
gem "therubyracer", platforms: :ruby
gem "uglifier", ">= 2.7.2"

# views
gem "active_link_to"
gem "metamagic"
gem "simple_form"
gem "slim"

#maps
gem "geocoder"
gem "gmaps4rails"

# all other gems
gem "decent_decoration"
gem "decent_exposure"
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'aws-sdk'
gem 'fog'
gem 'mini_magick'
gem "devise"
gem 'activeadmin', github: 'activeadmin'
gem "omniauth"
gem "omniauth-facebook"
gem "omniauth-twitter"
gem "omniauth-vkontakte"
gem "draper"
gem "seed_dump"
gem "flamegraph"
gem "google-analytics-rails"
gem "interactor"
gem "kaminari"
gem "memory_profiler"
gem "puma"
gem "pundit"
gem "rack-canonical-host"
gem "rack-mini-profiler", require: false
gem "responders"
gem "rollbar"
gem "seedbank"
gem "stackprof"

group :staging, :production do
  gem "newrelic_rpm"
  gem "rails_stdout_logging"
end

group :test do
  gem "capybara"
  gem "capybara-webkit"
  gem "codeclimate-test-reporter", require: false
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "webmock", require: false
end

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "byebug"
  gem "coffeelint"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem "fuubar", "~> 2.0.0.rc1"
  gem "jasmine", "> 2.0"
  gem "jasmine-jquery-rails"
  gem "pry-rails"
  gem "rails_best_practices", require: false
  gem "rspec-rails", "~> 3.0"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "scss_lint", require: false
  gem "slim_lint", require: false
end

group :development do
  gem "bullet"
  gem "foreman", require: false
  gem "letter_opener"
  gem "quiet_assets"
  gem "rails-erd"
  gem 'rails_12factor'
  gem "slim-rails"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console", "~> 2.0"
end
