module SpreadOrm
  module ActiveRecord
    
    class Engine < Rails::Engine
      paths["app/models"] = "sp-orm/active_record/models"
    end

  end
end
