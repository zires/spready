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
  end
  
end
