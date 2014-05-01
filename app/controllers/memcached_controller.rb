class MemcachedController < ApplicationController
  def index
    cacheme
  end

  def invalidate
    puts "Invalidating"
    Rails.cache.delete('anything-awesome')
    puts "Invalidation done"
    redirect_to memcached_index_path
  end

private
  def cacheme
    puts "Checking cache"
    Rails.cache.fetch('anything-awesome', :expires_in => 5.minute) do
        puts "not in cache"
        sleep 5
    end
    puts "End cache check"
  end

end
