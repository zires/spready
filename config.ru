# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
Spready::Application.paths["public"] = ["vendor/themes/default/assets/"]
run Spready::Application
