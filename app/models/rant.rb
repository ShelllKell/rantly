class Rant < ActiveRecord::Base
  belongs_to :user

  validates :topic, presence: {:message => "Your rant could not be posted"}
  default_scope { order("created_at DESC") }

end