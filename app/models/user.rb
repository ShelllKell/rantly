class User < ActiveRecord::Base
  has_secure_password

  has_many :rants
  
  validates :username, presence: {message: "Username Required."}
  validates :password, presence: {message: "Password Required."}
  # validates :bio, length: {maximum: 700}

end