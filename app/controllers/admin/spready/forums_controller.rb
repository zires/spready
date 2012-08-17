class Admin::Spready::ForumsController < Admin::Spready::ApplicationController
  # GET /admin/spready/forums
  # GET /admin/spready/forums.json
  def index
    @forums = Spready::Forum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forums }
    end
  end

  # GET /admin/spready/forums/1
  # GET /admin/spready/forums/1.json
  def show
    @admin_spready_forum = Admin::Spready::Forum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_spready_forum }
    end
  end

  # GET /admin/spready/forums/new
  # GET /admin/spready/forums/new.json
  def new
    @forum = Spready::Forum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /admin/spready/forums/1/edit
  def edit
    @admin_spready_forum = Admin::Spready::Forum.find(params[:id])
  end

  # POST /admin/spready/forums
  # POST /admin/spready/forums.json
  def create
    @forum = Spready::Forum.new(params[:admin_spready_forum])

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
        format.json { render json: @forum, status: :created, location: @forum }
      else
        format.html { render action: "new" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/spready/forums/1
  # PUT /admin/spready/forums/1.json
  def update
    @admin_spready_forum = Admin::Spready::Forum.find(params[:id])

    respond_to do |format|
      if @admin_spready_forum.update_attributes(params[:admin_spready_forum])
        format.html { redirect_to @admin_spready_forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_spready_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/spready/forums/1
  # DELETE /admin/spready/forums/1.json
  def destroy
    @admin_spready_forum = Admin::Spready::Forum.find(params[:id])
    @admin_spready_forum.destroy

    respond_to do |format|
      format.html { redirect_to admin_spready_forums_url }
      format.json { head :no_content }
    end
  end
end
