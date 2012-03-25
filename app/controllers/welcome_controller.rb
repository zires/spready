class WelcomeController < ApplicationController
  
  def index
    unless Site.specifical_index
      if Site.forum_id
        @forum = Site.forum
        render :template => 'forums/show'
      else
        redirect_to install_path
      end
    end
  end

end