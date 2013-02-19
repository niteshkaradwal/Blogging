module PostsHelper
  def method_like ( post )
     @post = post
    
    count=0 
    like = @post.likes.where(:user_id => current_user.id)[0]
    if like.blank?
      link = link_to "like", new_post_like_path(@post)
    else
      link = link_to "Unlike", post_like_path(@post, like), method: :delete
    end
    @post.likes.each do |like| 
      count +=1 
    end   
    return link, count 
  end
end
