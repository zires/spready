class Spready::Admin::ForumsController < ApplicationController
  # GET /spready/admin/forums
  # GET /spready/admin/forums.json
  def index
    @forums = Spready::Forum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forums }
    end
  end

  # GET /spready/admin/forums/1
  # GET /spready/admin/forums/1.json
  def show
    @spready_admin_forum = Spready::Admin::Forum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spready_admin_forum }
    end
  end

  # GET /spready/admin/forums/new
  # GET /spready/admin/forums/new.json
  def new
    @forum = Spready::Forum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /spready/admin/forums/1/edit
  def edit
    @spready_admin_forum = Spready::Admin::Forum.find(params[:id])
  end

  # POST /spready/admin/forums
  # POST /spready/admin/forums.json
  def create
    @spready_admin_forum = Spready::Forum.new(params[:spready_admin_forum])

    respond_to do |format|
      if @spready_admin_forum.save
        format.html { redirect_to @spready_admin_forum, notice: 'Forum was successfully created.' }
        format.json { render json: @spready_admin_forum, status: :created, location: @spready_admin_forum }
      else
        format.html { render action: "new" }
        format.json { render json: @spready_admin_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spready/admin/forums/1
  # PUT /spready/admin/forums/1.json
  def update
    @spready_admin_forum = Spready::Admin::Forum.find(params[:id])

    respond_to do |format|
      if @spready_admin_forum.update_attributes(params[:spready_admin_forum])
        format.html { redirect_to @spready_admin_forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spready_admin_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spready/admin/forums/1
  # DELETE /spready/admin/forums/1.json
  def destroy
    @spready_admin_forum = Spready::Admin::Forum.find(params[:id])
    @spready_admin_forum.destroy

    respond_to do |format|
      format.html { redirect_to spready_admin_forums_url }
      format.json { head :no_content }
    end
  end
end
