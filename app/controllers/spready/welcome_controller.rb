class Spready::WelcomeController < Spready::ApplicationController
  
  def index
    forum_count = Spready::Forum.count
    case
      when forum_count == 0
        render :text => 'Not have forum yet'
      when forum_count == 1
        redirect_to Spready::Forum.first
      when forum_count > 1
        @forums = Spready::Forum
      else
        not_found
    end
  end

end