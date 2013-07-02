class WriteToDatabaseJob
  @queue = 'test'

  def self.perform
    for i in 1..500
      puts "Iteration: #{i}/500"
      for x in 1..10
        Post.create! :content => "Iteration #{x}|#{i} - From worker",
          :name => "Node: #{Socket.gethostbyname(Socket.gethostname).first}",
          :title => "Entry from #{Socket.gethostbyname(Socket.gethostname).first}: #{Socket.ip_address_list.detect{|intf| intf.ipv4_private?}}"
        sleep rand(3)
      end
      sleep rand(5)
    end
  end
end