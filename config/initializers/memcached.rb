memcached_file = Rails.root.join('config/memcached.yml')
if File.exist?(memcached_file)
  memcached_config = YAML.load_file(memcached_file)
  if memcached_config['servers']
    memcached_hosts = memcached_config['servers']
  end
end
memcached_hosts ||= ENV['MEMCACHE_SERVERS'] || '127.0.0.1:11211'
Rails.application.config.cache_store = :dalli_store, *memcached_hosts
