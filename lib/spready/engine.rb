# encoding: utf-8
module Spready
  class Engine < ::Rails::Engine
    isolate_namespace Spready

    # Before set_load_path, detect which orm should be use
    initializer :set_orm_path, :before => :set_load_path do

      if Spready.use_devise?

        if not defined?(ApplicationController)
          class ApplicationController < ActionController::Base
          end
        end

        Devise.setup do |config|
          config.router_name = :spready
          config.parent_controller = 'ActionController::Base'
        end
      end

      if defined?(Mongoid)
        require 'devise/orm/mongoid' if Spready.use_devise?
        paths["app/models"] << "orm/mongoid"
      else
        paths["app/models"] << "orm/active_record"
      end

    end

    # #paths["app/models"] << "orm/mongoid"

    # initializer 'spready.environment', :before => :set_load_path do
      
    #   if defined?(Mongoid)
    #     paths["app/models"] << "orm/mongoid"
    #   else
    #     paths["app/models"] << "orm/mysql"
    #   end

    #   #puts "1"

    #   #config = app.config

    #   # config.after_initialize do
    #   #   puts "2"
    #   #   #Spready::Engine.paths["app/models"] << "orm/mongoid" if defined?(Mongoid)
    #   # end

    # end

    # # initializer "spready.environment" do |app|
      
    # #   config = app.config

    # #   config.after_initialize do |app|
        
    # #     if defined?(Mongoid)
    # #       paths["app/models"] << "orm/mongoid"
    # #     end

    # #   end #config.after_initialize

    # # end
    
  end
end
