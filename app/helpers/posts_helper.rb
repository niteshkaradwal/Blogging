module PostsHelper
  
  def like_for_comments(comment)
    if comment.likes.where(:user_id == current_user.id)[0].blank? 
      link = link_to 'Like', new_post_comment_likecomment_path(comment.post.id, comment.id), :class => "btn btn-link" 
    else 
      likee = comment.likes.where(:user_id == current_user.id) 
      link = link_to 'Unlike', post_comment_likecomment_path(comment.post.id, comment.id, likee[0].id), method: :delete, :class => "btn btn-link" 
    end 
    return link
  end
  
  def authentication_for_destroy?(comment)
    if comment.commenter_id == current_user.id || comment.post.user.id == current_user.id 
      link = link_to 'Destroy', [comment.post, comment], method: :delete, data: { confirm: 'Are you sure?' }, :class => "btn btn-link" 
      return link
    end  
  end 
end



