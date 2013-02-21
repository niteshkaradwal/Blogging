module HomesHelper

  def show_post_of_followers(user)
    user = User.find(user)
    user.posts.each do |post|
      link = link_to " #{ user.name } ", post, :class => "btn btn-mini btn-primary"  
      email = user.email 
      title = post.title
      post = post.body 
    return link,email,title,post
    end
    
  end  
      
end
