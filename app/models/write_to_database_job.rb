class WriteToDatabaseJob
  @queue = 'test'

  def self.perform
    Post.create! :content => "From a worker", :name => "from-a-worker", :title => "Worker"
  end
end
