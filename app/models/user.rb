class User < ActiveRecord::Base
  before_create { set_confirmation_token(:token) }

  has_secure_password

  has_many :rants, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id
  has_attached_file :image, styles: {
                     thumb: '100x100>'   }

  validates :username, presence: {error: "Username required, must be unique."}
  validates :password, length: {minimum: 8}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, length: {maximum: 500}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.authenticate_user(email, password)
    user = find_by_email(email)
    if user && user.authenticate(password)
      user if user.confirmed
    else
      nil
    end
  end

  private

  def set_confirmation_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
