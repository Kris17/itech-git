class NewsPostsController < ApplicationController
  def index
    @news = NewsPost.all
  end

  def show
    @news_post = NewsPost.find(params[:id])
  end
end
