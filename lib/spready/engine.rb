module Spready
  class Engine < ::Rails::Engine
    isolate_namespace Spready

    # Before set_load_path, detect which orm should be used.
    initializer :set_orm_path, :before => :set_load_path do

      case Spready.orm.to_s
        when 'mongoid'
          require 'devise/orm/mongoid' if Spready.use_devise?
          paths["app/models"] << "orm/mongoid"
        when 'active_record'
          paths["app/models"] << "orm/active_record"
      end

    end

    initializer 'Defined ApplicationController if necessary' do

      if not defined?(ApplicationController)
        class ::ApplicationController < ::ActionController::Base
          protect_from_forgery
        end
      end

    end

    initializer 'Setup devise for spready' do
      if Spready.use_devise?

        Devise.setup do |config|
          config.router_name = :spready
          config.parent_controller = 'ActionController::Base'
        end

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
