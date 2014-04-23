class BackgroundEmailJob
  @queue = 'bg_email_queue'

  def self.perform(email_address)
    post_hash = {
      'content' => "Test background email",
      'name' => "I like email",
      'title' => "The world ain't enough",
      'email' => email_address
    }
    post = Post.new post_hash
    puts "Sending email to #{email_address}"
    UserMailer.hello_email(post).deliver
  end
end
