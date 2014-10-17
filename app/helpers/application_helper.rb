module ApplicationHelper

  def followed(user)
    @follow = Follow.find_by(follower_id: current_user.id, followee_id: user.id)
    @follow == nil ? false : true
  end

end
