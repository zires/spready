# This file is used by Rack-based servers to start the application.

if ::File.exist?( ::File.expand_path('../sp_config.yml',  __FILE__) )

  require ::File.expand_path('../config/environment',  __FILE__)
  
  run Spready::Application

else
  
  require ::File.dirname(__FILE__) + '/spready_config'

  run SpreadyConfig

end




