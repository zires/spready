class CategoriesController < ApplicationController
  
  def show
    @forum    = Forum.find_by_slug(params[:forum_id])
    @category = @forum.categories.find_by_slug(params[:id])
    @topics   = @category.topics
  end

end
