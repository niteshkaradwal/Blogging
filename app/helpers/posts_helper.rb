module PostsHelper
  
  def like_for_comments(comment)
    if comment.likes.where(:user_id == current_user.id)[0].blank? 
      link = link_to "Like #{comment.likes.count}", new_post_comment_likecomment_path(comment.post.id, comment.id), :class => "btn btn-link" 
    else 
      likee = comment.likes.where(:user_id == current_user.id) 
      link = link_to "Unlike #{comment.likes.count}", post_comment_likecomment_path(comment.post.id, comment.id, likee[0].id), method: :delete, :class => "btn btn-link" 
    end 
    return link
  end
  
  def authentication_for_destroy(comment)
    if comment.commenter_id == current_user.id || comment.post.user.id == current_user.id 
      link = link_to 'Destroy', [comment.post, comment], method: :delete, data: { confirm: 'Are you sure?' }, :class => "btn btn-link" 
      return link
    end  
  end 
  
  def like_for_post(post)
    if post.likes.where(:user_id => current_user.id)[0].blank? 
      link = link_to "like #{post.likes.count}", new_post_like_path(post) 
    else 
      like = post.likes.where(:user_id => current_user.id)[0] 
      link = link_to "Unlike #{post.likes.count}", post_like_path(post, like.id), method: :delete 
    end 
    return link
  end
  
  def notification_for_current_user
    current_user.posts.each do |post| 
      if post.comments.where(:status => false).present? 
        total = post.comments.where(:status => false).count
        link = link_to " #{ total } Notification ", comments_path, :class => "btn btn-success" 
      end
    return link
    end 
  end 
  
  
  
end



