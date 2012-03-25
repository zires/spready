class Admin::SiteController < ApplicationController

  def show
    @site = Site.instance

    respond_to do |format|
      format.html
      format.json { render :json => @site }
    end
  end

  def edit
    @site = Site.instance
  end

  def update
  end

  def install
    @forum = Forum.new
  end
  
  def done
    @forum = Forum.new(params[:forum])
    site   = Site.instance
    site.forum_id = @forum.id
    if @forum.save and site.save
      redirect_to root_path
    else
      render :action => 'install'
    end  
  end

end
