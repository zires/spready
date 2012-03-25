class CommentsController < ApplicationController
  
  def new
    @forum    = Forum.find_by_slug(params[:forum_id])
    @category = @forum.categories.find_by_slug(params[:category_id])
    @topic    = @category.topics.find_by_token(params[:id])
    @comment  = @topic.comments.new
  end

  def create
    @forum    = Forum.find_by_slug(params[:forum_id])
    @category = @forum.categories.find_by_slug(params[:category_id])
    @topic    = @category.topics.find_by_token(params[:id])
    @comment  = @topic.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@forum, @category, @topic), notice: 'Comment was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

end
