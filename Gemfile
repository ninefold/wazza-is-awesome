source 'https://rubygems.org'

ruby '2.1.4'

gem 'rails', '3.2.9'

group :development, :test do
  gem 'sqlite3'
end

group :production, :staging do
  gem 'pg'
end

gem 'skylight'
gem 'resque', '~> 1.24.1'
gem 'lograge'
gem 'dalli'
gem 'memcachier'

# required for using 'building' to generate container
#gem 'highline', :require => false
#gem 'building', :require => false
#gem 'rails_12factor'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'twitter-bootstrap-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# check that curb gem package is installed properly OCT-3262
gem 'curb'

# test cron jobs using whenever. the :require => false
# tells bundler not to load the gem automatically
gem 'whenever', :require => false

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
