memcached_config = YAML.load_file(Rails.root.join('config/memcached.yml'))
memcached_hosts = memcached_config['defaults']['servers']