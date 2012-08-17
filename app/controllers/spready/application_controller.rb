class Spready::ApplicationController < ActionController::Base
  protect_from_forgery
  
  # theme Site.theme
  private

  def not_found
    raise ActiveRecord::RecordNotFound.new('Not Found')
  end

end
