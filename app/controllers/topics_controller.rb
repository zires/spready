class TopicsController < ApplicationController
  
  def show
    @forum    = Forum.find_by_slug(params[:forum_id])
    @category = @forum.categories.find_by_slug(params[:category_id])
    @topic    = @category.topics.find_by_token(params[:id])
    @comments = @topic.comments
  end

  def new
    @forum    = Forum.find_by_slug(params[:forum_id])
    @category = @forum.categories.find_by_slug(params[:id])
    @topic    = @category.topics.new
  end

  def create
    @forum    = Forum.find_by_slug(params[:forum_id])
    @category = @forum.categories.find_by_slug(params[:id])
    @topic    = @category.topics.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to category_path(@forum), notice: 'Topci was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

end
