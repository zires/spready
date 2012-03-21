class Admin::ForumsController < Admin::ApplicationController
  # GET /admin/forums
  # GET /admin/forums.json
  def index
    @forums = Forum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forums }
    end
  end

  # GET /admin/forums/1
  # GET /admin/forums/1.json
  def show
    @forum = Forum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /admin/forums/new
  # GET /admin/forums/new.json
  def new
    @forum = Forum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /admin/forums/1/edit
  def edit
    @forum = Forum.find(params[:id])
  end

  # POST /admin/forums
  # POST /admin/forums.json
  def create
    @forum = Forum.new(params[:forum])

    respond_to do |format|
      if @forum.save
        flash[:notice] = 'Forum was successfully created.'
        format.html { redirect_to :action => 'index' }
        # I do not know why below line doesn't work.
        #format.html { redirect_to :action => 'index', :notice => 'Forum was successfully created.' }
        format.json { render json: @forum, status: :created, location: @forum }
      else
        format.html { render action: "new" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/forums/1
  # PUT /admin/forums/1.json
  def update
    @forum = Forum.find(params[:id])

    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        flash[:notice] = 'Forum was successfully updated.'
        format.html { redirect_to :action => 'index' }
        # I do not know why below line doesn't work.
        #format.html { redirect_to :action => 'index', :notice => 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/forums/1
  # DELETE /admin/forums/1.json
  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy

    respond_to do |format|
      format.html { redirect_to admin_forums_url }
      format.json { head :no_content }
    end
  end
end
