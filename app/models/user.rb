class User < ActiveRecord::Base

  has_many :rants

  validates :user, presence: true

end