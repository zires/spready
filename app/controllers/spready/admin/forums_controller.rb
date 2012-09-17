module Spready
  class Admin::ForumsController < Admin::ApplicationController
    load_and_authorize_resource :class => Spready::Forum

    # GET /admin/forums
    # GET /admin/forums.json
    def index
      @admin_forums = Forum.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @admin_forums }
      end
    end
  
    # GET /admin/forums/1
    # GET /admin/forums/1.json
    # TODO: Change this action to display analysis.
    def show
      @admin_forum = Forum.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @admin_forum }
      end
    end
  
    # GET /admin/forums/new
    # GET /admin/forums/new.json
    def new
      @admin_forum = Forum.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @admin_forum }
      end
    end
  
    # GET /admin/forums/1/edit
    def edit
      @admin_forum = Forum.find(params[:id])
    end
  
    # POST /admin/forums
    # POST /admin/forums.json
    def create
      @admin_forum = Forum.new(params[:forum])
      @admin_forum.creater = current_user

      respond_to do |format|
        if @admin_forum.save
          format.html { redirect_to :action => 'index', :notice => 'Forum was successfully created.' }
          format.json { render :json => @admin_forum, :status => :created }
        else
          format.html { render :action => "new" }
          format.json { render :json => @admin_forum.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /admin/forums/1
    # PUT /admin/forums/1.json
    def update
      @admin_forum = Forum.find(params[:id])
  
      respond_to do |format|
        if @admin_forum.update_attributes(params[:forum])
          format.html { redirect_to :action => 'index', :notice => 'Forum was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render :json => @admin_forum.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /admin/forums/1
    # DELETE /admin/forums/1.json
    def destroy
      @admin_forum = Forum.find(params[:id])
      @admin_forum.destroy
  
      respond_to do |format|
        format.html { redirect_to admin_forums_url }
        format.json { head :no_content }
      end
    end
  end
end
