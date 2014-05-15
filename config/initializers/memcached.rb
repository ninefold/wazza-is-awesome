memcached_config = YAML.load_file(Rails.root.join('config/memcached.yml'))
if memcached_config['servers']
  memcached_hosts = memcached_config['servers']
end
Rails.application.config.cache_store = :dalli_store, *memcached_hosts

