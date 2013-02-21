module FollowersHelper
  
  def check_for_follow_unfollow_link?(follower,user)
     follower.user_id == current_user.id && follower.follower_id == user.id
  end

end
