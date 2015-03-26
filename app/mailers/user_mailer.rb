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

  def follow_rant_email(user)
    Follow.where(followee_id: user.id).each do |following|
      @user = User.where(following.follower_id)
      @user = user
      @url = Rails.env.production? ? 'http://cryptic-ridge-6753.herokuapp.com/' : 'http://localhost:3000'
      mail(to: @user.email, subject: "#{user.first_name} has posted a new rant!")
    end
  end

end