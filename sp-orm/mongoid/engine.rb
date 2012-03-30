require 'devise/orm/mongoid'
module SpreadOrm
  module Mongoid
    
    class Engine < Rails::Engine
      paths["app/models"] = "sp-orm/mongoid/models"
    end

  end
end
