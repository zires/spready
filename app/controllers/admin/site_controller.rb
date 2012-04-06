class Admin::SiteController < Admin::ApplicationController
  
  def show
    @site  = ::Site.instance
    @forum = ::Site.forum
    respond_to do |format|
      format.html
      format.json { render :json => @site }
    end
  end

  def edit
    @site = ::Site.instance
  end

  def update
    @site = ::Site.instance
    if @site.update_attributes(params[:site])
      redirect_to :action => 'show'
    else
      render :action => 'edit'
    end
  end

  def install
    @forum = Forum.new
  end
  
  def done
    @forum        = Forum.new(params[:forum])
    site          = ::Site.instance
    site.forum_id = @forum.id.to_s
    if @forum.save and site.save
      redirect_to root_path
    else
      redirect_to install_path
    end  
  end

end
