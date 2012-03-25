class Admin::CategoriesController < Admin::ApplicationController
  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @forum      = Forum.find_by_slug(params[:forum_id])
    @categories = @forum.categories

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /admin/categories/new
  # GET /admin/categories/new.json
  def new
    @forum    = Forum.find_by_slug(params[:forum_id])
    @category = @forum.categories.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /admin/categories/1/edit
  def edit
    @forum    = Forum.find_by_slug(params[:forum_id])
    @category = @forum.categories.find_by_slug(params[:id])
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @forum    = Forum.find_by_slug(params[:forum_id])
    @category = @forum.categories.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_forum_categories_path(@forum), notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/categories/1
  # PUT /admin/categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:admin_category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to admin_categories_url }
      format.json { head :no_content }
    end
  end
end
