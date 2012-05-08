require 'yaml'

module Spready

  @@setting = YAML.load_file(::File.expand_path('../../config/spready.yml',  __FILE__))

  class << self

    def orm
      @@setting['orm']
    end

    def database
      @@setting['database']
    end

    def app_models_path
      case Spready.orm
      when 'active_record' then "sp-orm/active_record/models"
      when 'mongoid' then "sp-orm/mongoid/models"
      else
        raise "#{Spready.orm} not support!!"
      end
    end
    
  end

end