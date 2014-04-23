class UserMailer < ActionMailer::Base
  default from: "ninefolddev@ninefold.com"

  def hello_email(post)
    @post = post
    if @post.email
      dbg_str = "Sending email to #{@post.email} with env vars: " +
        "[domain] #{ENV['NF_SENDGRID_DOMAIN']} [username] #{ENV['NF_SENDGRID_USERNAME']} [password] #{ENV['NF_SENDGRID_PASSWORD']}"
      logger.info dbg_str
      puts dbg_str
      mail(to: @post.email, subject: 'Email from wazza-is-awesome')
    else
      logger.info "No email specified for this record. Not sending email."
      puts "No email specified for this record. Not sending email."
    end
  end
end
