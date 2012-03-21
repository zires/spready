class WelcomeController < ApplicationController
  
  def index
    unless Site.instance.specifical_index
      if Site.instance.forum
        redirect_to Site.instance.forum
      else
        redirect_to '/install'
      end
    end
  end

end