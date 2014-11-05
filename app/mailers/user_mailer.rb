class UserMailer < ActionMailer::Base

  default from: 'ihaterantly@gmail.com'
  default host: Rails.root

  def welcome_email(user)
    @user = user
    @url = Rails.env.production? ? 'http://cryptic-ridge-6753.herokuapp.com/' : 'http://localhost:3000'

    mail(to: @user.email, subject: "Welcome to Rant.ly")
  end

  def confirmation_email(user)
    @token = user.token
    @user = user
    @url = Rails.env.production? ? 'http://cryptic-ridge-6753.herokuapp.com/' : 'http://localhost:3000'

    mail(to: @user.email, subject: "Please confirm your email - Rant.ly")
  end

  # def follow_rant_email(user, rant)
  #   @user = user
  #   @ranter = rant.user.username
  #   @rant_url = user_rant_path(rant.user_id, rant)
  #
  #   mail(to: @user.email, subject: "New Rant from #{@ranter}")
  # end

end