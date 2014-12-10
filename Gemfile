source 'https://rubygems.org'

gem 'rails', '4.1.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

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

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.5'
  gem 'coffee-rails', '~> 4.1.0'

  gem 'twitter-bootstrap-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 2.6.0'
end

gem 'jquery-rails'

# check that curb gem package is installed properly OCT-3262
gem 'curb'

# test cron jobs using whenever. the :require => false
# tells bundler not to load the gem automatically
gem 'whenever', :require => false

# everyone loves websockets
gem 'websocket-rails'

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
