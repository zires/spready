module Spready
  class Admin::CategoriesController < Admin::ApplicationController
    load_and_authorize_resource :class => Spready::Category

    # GET /admin/categories
    # GET /admin/categories.json
    def index
      @admin_categories = Category.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @admin_categories }
      end
    end
  
    # GET /admin/categories/1
    # GET /admin/categories/1.json
    def show
      @admin_category = Admin::Category.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @admin_category }
      end
    end
  
    # GET /admin/categories/new
    # GET /admin/categories/new.json
    def new
      @admin_category = Category.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @admin_category }
      end
    end
  
    # GET /admin/categories/1/edit
    def edit
      @admin_category = Admin::Category.find(params[:id])
    end
  
    # POST /admin/categories
    # POST /admin/categories.json
    def create
      @admin_forum = Forum.find(params[:category][:forum_id])
      @admin_category = @admin_forum.categories.build(params[:category])
      @admin_category.creater = current_user

      respond_to do |format|
        if @admin_category.save
          format.html { redirect_to @admin_category, :notice => 'Category was successfully created.' }
          format.json { render :json => @admin_category, :status => :created, :location => @admin_category }
        else
          format.html { render :action => "new" }
          format.json { render :json => @admin_category.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /admin/categories/1
    # PUT /admin/categories/1.json
    def update
      @admin_category = Admin::Category.find(params[:id])
  
      respond_to do |format|
        if @admin_category.update_attributes(params[:admin_category])
          format.html { redirect_to @admin_category, :notice => 'Category was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @admin_category.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /admin/categories/1
    # DELETE /admin/categories/1.json
    def destroy
      @admin_category = Admin::Category.find(params[:id])
      @admin_category.destroy
  
      respond_to do |format|
        format.html { redirect_to admin_categories_url }
        format.json { head :no_content }
      end
    end
  end
end
