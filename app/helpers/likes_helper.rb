module LikesHelper

  def search_for_like(post)
    return post.likes.where(:user_id => current_user.id)[0]
  end
  
  def like_exist_or_not?(post)
    post.likes.where(:user_id => current_user.id)[0].blank?
  end
end
