class WelcomeController < ApplicationController
  
  def index
    unless Site.specifical_index
      if Site.forum
        redirect_to Site.forum
      else
        redirect_to '/install'
      end
    end
  end

end