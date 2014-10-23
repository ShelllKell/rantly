module UsersHelper

  def full_name(user)
    [user.first_name, user.last_name].join(" ")
  end


  def order_favorites(rants)
    rants.sort_by { |rant| rant.favorite_count }.reverse
  end

end