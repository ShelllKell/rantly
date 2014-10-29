class User < ActiveRecord::Base
  has_secure_password

  has_many :rants, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id
  has_attached_file :image, styles: {
                     thumb: '100x100>'
                    }

  validates :username, presence: {error: "Username required, must be unique."}
  validates :password, length: {minimum: 8}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, length: {maximum: 500}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
