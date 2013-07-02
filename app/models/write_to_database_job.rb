class WriteToDatabaseJob
  @queue = 'test'

  def self.perform
    iterations = 250
    posts_per_iteration = 500
    sleep_between_iterations = 1
    sleep_between_writes = 0

    puts "Creating 1000 records each iteration. #{iterations} iterations. #{sleep_between_iterations} seconds sleep between each iteration. #{sleep_between_writes} second wait between each write."
    for i in 1..250
      puts "Iteration: #{i}/#{iterations}"
      for x in 1..posts_per_iteration
        Post.create! :content => ((0...512).map{ ('a'..'z').to_a[rand(26)] }.join),
          :name => "Autogen Post, from server: #{Socket.gethostbyname(Socket.gethostname).first}",
          :title => "New Post at: #{Time.now.inspect}"
        sleep sleep_between_writes
      end
      sleep rand(sleep_between_iterations)
    end
    puts "Cleaning up #{Post.count} posts after #{iterations} iterations"
    Post.delete_all
  end
end