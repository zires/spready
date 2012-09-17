module Spready
  class Admin::TopicsController < ApplicationController
    load_and_authorize_resource :class => Spready::Forum

    # GET /admin/topics
    # GET /admin/topics.json
    def index
      @admin_topics = Topic.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @admin_topics }
      end
    end
  
    # GET /admin/topics/1
    # GET /admin/topics/1.json
    def show
      @admin_topic = Admin::Topic.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @admin_topic }
      end
    end
  
    # GET /admin/topics/new
    # GET /admin/topics/new.json
    def new
      @admin_topic = Topic.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @admin_topic }
      end
    end
  
    # GET /admin/topics/1/edit
    def edit
      @admin_topic = Admin::Topic.find(params[:id])
    end
  
    # POST /admin/topics
    # POST /admin/topics.json
    def create
      @admin_topic = Topic.new(params[:topic])
  
      respond_to do |format|
        if @admin_topic.save
          format.html { redirect_to :action => 'index', :notice => 'Topic was successfully created.' }
          format.json { render :json => @admin_topic, :status => :created, :location => @admin_topic }
        else
          format.html { render :action => "new" }
          format.json { render :json => @admin_topic.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /admin/topics/1
    # PUT /admin/topics/1.json
    def update
      @admin_topic = Admin::Topic.find(params[:id])
  
      respond_to do |format|
        if @admin_topic.update_attributes(params[:admin_topic])
          format.html { redirect_to @admin_topic, :notice => 'Topic was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @admin_topic.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /admin/topics/1
    # DELETE /admin/topics/1.json
    def destroy
      @admin_topic = Admin::Topic.find(params[:id])
      @admin_topic.destroy
  
      respond_to do |format|
        format.html { redirect_to admin_topics_url }
        format.json { head :no_content }
      end
    end
  end
end
