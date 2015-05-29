class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  
  def about
  end

  def contact
  end

  def index
    @posts = Micropost.all
    @posts = @posts.paginate(page: params[:page])
    @news = NewsPost.first(3)
    @categories = Category.all
    @recent = Micropost.first(3)
  end

end
