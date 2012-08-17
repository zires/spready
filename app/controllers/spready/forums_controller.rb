class Spready::ForumsController < ApplicationController
  # GET /spready/forums
  # GET /spready/forums.json
  def index
    @spready_forums = Spready::Forum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spready_forums }
    end
  end

  # GET /spready/forums/1
  # GET /spready/forums/1.json
  def show
    @spready_forum = Spready::Forum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spready_forum }
    end
  end

  # GET /spready/forums/new
  # GET /spready/forums/new.json
  def new
    @spready_forum = Spready::Forum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spready_forum }
    end
  end

  # GET /spready/forums/1/edit
  def edit
    @spready_forum = Spready::Forum.find(params[:id])
  end

  # POST /spready/forums
  # POST /spready/forums.json
  def create
    @spready_forum = Spready::Forum.new(params[:spready_forum])

    respond_to do |format|
      if @spready_forum.save
        format.html { redirect_to @spready_forum, notice: 'Forum was successfully created.' }
        format.json { render json: @spready_forum, status: :created, location: @spready_forum }
      else
        format.html { render action: "new" }
        format.json { render json: @spready_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spready/forums/1
  # PUT /spready/forums/1.json
  def update
    @spready_forum = Spready::Forum.find(params[:id])

    respond_to do |format|
      if @spready_forum.update_attributes(params[:spready_forum])
        format.html { redirect_to @spready_forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spready_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spready/forums/1
  # DELETE /spready/forums/1.json
  def destroy
    @spready_forum = Spready::Forum.find(params[:id])
    @spready_forum.destroy

    respond_to do |format|
      format.html { redirect_to spready_forums_url }
      format.json { head :no_content }
    end
  end
end
