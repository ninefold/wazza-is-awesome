worker: bundle exec rake environment resque:work --trace QUEUE=*
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
init: (bundle exec rake db:setup || true) && (bundle exec rake db:migrate)
