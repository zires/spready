module Spready
  class WelcomeController < ApplicationController
    
    def index
      count = Forum.count
      case
        when count == 0
          render 'empty'
        when count == 1
          redirect_to Forum.first
        when count > 1
          @forums = Forum.all
        else
          not_found
      end
    end

  end
end
