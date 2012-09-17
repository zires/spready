module Spready
  module Admin
    class ApplicationController < ::Spready::ApplicationController
      layout 'spready/admin/application'

      before_filter(Spready.authenticate_method) if Spready.authenticate_method

      check_authorization

      rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert =>  exception.message
      end

    end
  end
end