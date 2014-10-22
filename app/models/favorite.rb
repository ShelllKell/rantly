class Favorite < ActiveRecord::Base

  belongs_to :rant, foreign_key: :rant_id
  belongs_to :user, foreign_key: :user_id


  def favorite_count
    rant.favorites.length
  end

end
