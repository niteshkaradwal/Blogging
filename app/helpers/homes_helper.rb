module HomesHelper

  def show_post_of_followers(follower,post)
    
    

     

        link = link_to " #{ follower.name } ", post, :class => "btn btn-mini btn-primary"  
        email = follower.email 
        title = post.title
        post = post.body 
      return link,email,title,post
      
      
   
    
  end  
      
end
