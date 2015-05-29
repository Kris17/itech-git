class CategoriesController < ApplicationController
  def show
    @category = Category.where(:id => params[:id]).first
    category_id = @category.id
    @posts = Micropost.where(category_id: category_id)
  end
end
