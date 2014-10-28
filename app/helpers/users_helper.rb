module UsersHelper

  def full_name(user)
    [user.first_name, user.last_name].join(" ")
  end

  def user_comments(user)
    user.comments.where(commentable_type: "User")
  end

end