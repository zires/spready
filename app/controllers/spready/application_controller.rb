module Spready
  class ApplicationController < ActionController::Base
    protect_from_forgery

    # theme Site.theme

    private

    def not_found
      raise ActiveRecord::RecordNotFound.new('Not Found')
    end

    def current_ability
      @current_ability ||= Ability.new(current_user)
    end
    
  end
end
