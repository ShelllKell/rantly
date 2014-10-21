class User < ActiveRecord::Base
  has_secure_password

  has_many :rants

  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id


  validates :username, presence: {error: "Username Required."}
  validates :password, length: {minimum: 8}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, length: {maximum: 500}


  def following(user)
    @follow = Follow.find_by(follower_id: current_user.id, followee_id: user.id)

    unless current_user(@follow)
      link_to "Follow", user_follows_path(user), method: :post
    else
      link_to "Unfollow", user_follow_path(user.id, @follow), method: :delete
    end
  end

end