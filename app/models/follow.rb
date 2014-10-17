class Follow < ActiveRecord::Base

  validates_presence_of :follower_id, :followee_id

  belongs_to :user, foreign_key: :follower_id
  belongs_to :user, foreign_key: :followee_id

end