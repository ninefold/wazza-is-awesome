class PrintEnvVarsJob
  @queue = 'env_vars_queue'

  def self.perform
    puts "Environment variables"
    puts "====================="
    ENV.keys.sort {|x,y| x.upcase <=> y.upcase}.each do |key|
      puts "#{key}=#{ENV[key]}"
    end
    puts
  end
end
