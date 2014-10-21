class User < ActiveRecord::Base
  has_secure_password

  has_many :rants

  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id


  validates :username, presence: {message: "Username Required."}
  validates :password, presence: {message: "Password Required."}
  # validates :bio, length: {maximum: 700}

  def following?(user)

  end

end