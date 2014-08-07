if memcached_file = Rails.root.join('config/memcached.yml')
  memcached_config = YAML.load_file(memcached_file)
  if memcached_config['servers']
    memcached_hosts = memcached_config['servers']
  end
end
Rails.application.config.cache_store = :dalli_store, *memcached_hosts

