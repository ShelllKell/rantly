class User < ActiveRecord::Base

  has_many :rants

  validates :username, presence: true

end