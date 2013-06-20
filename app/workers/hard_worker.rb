# app/workers/hard_worker.rb
class HardWorker
  include Resque::Worker

  def perform(name, count)
    puts 'Doing hard work'
  end
end
