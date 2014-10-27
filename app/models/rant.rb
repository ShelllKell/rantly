class Rant < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  has_many :favorites, dependent: :destroy

  validates :topic, presence: {:message => "must be less than 50 characters."}
  validates :rant, length: {:minimum => 140, too_short: "must be more than 140 characters."}

  default_scope { order("created_at DESC") }


  def favorite_count
    favorites.length
  end

end

