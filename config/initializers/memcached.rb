memcached_config = YAML.load_file(Rails.root.join('config/memcached.yml'))
memcached_hosts = memcached_config[Rails.env]['servers']
Rails.application.config.cache_store = :dalli_store, *memcached_hosts

