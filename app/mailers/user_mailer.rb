class UserMailer < ActionMailer::Base
  default from: "ninefolddev@ninefold.com"

  def hello_email(post)
    @post = post
    if @post.email
      mail(to: @post.email, subject: 'Email from wazza-is-awesome')
      logger.info "Sent email to #{@post.email}"
      puts "Sent email to #{@post.email}"
    else
      logger.info "No email specified for this record. Not sending email."
      puts "No email specified for this record. Not sending email."
    end
  end
end
