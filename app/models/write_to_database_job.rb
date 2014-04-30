class WriteToDatabaseJob
  @queue = 'test'

  def self.perform
    # updated to write 1GB of data each job run
    # which should take about 30 mins to run
    iterations = 1024
    posts_per_iteration = 1024
    post_byte_size = 64
    sleep_between_iterations = 1
    sleep_between_writes = 0

    puts "Job is kicking off with the following environment:"
    ENV.keys.each do |k|
      puts "#{k}=#{ENV[k]}"
    end
    puts "Creating #{posts_per_iteration} records each iteration. #{iterations} iterations. #{sleep_between_iterations} seconds sleep between each iteration. #{sleep_between_writes} second wait between each write."
    for i in 1..iterations
      puts "Iteration: #{i}/#{iterations}"
      for x in 1..posts_per_iteration
        Post.create! :content => ((0...post_byte_size).map{ ('a'..'z').to_a[rand(26)] }.join),
          :name => Socket.gethostname,
          :title => Time.now.inspect
        sleep rand * sleep_between_writes
      end
      sleep rand * sleep_between_iterations
    end
    puts "Created a total of #{Post.count} posts after #{iterations} iterations."
  end
end
