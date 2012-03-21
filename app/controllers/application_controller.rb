class ApplicationController < ActionController::Base
  protect_from_forgery

  theme Site.instance.theme
end
