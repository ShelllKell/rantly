module RantHelper

  def order_favorites(rants)
    rants.sort_by { |rant| rant.favorite_count }.reverse
  end

  def rant_comments(rant)
    rant.comments.where(commentable_type: "Rant")
  end

end