class ForumsController < ApplicationController
  def show
    @forum = Forum.find_by_slug(params[:id])
  end
end
