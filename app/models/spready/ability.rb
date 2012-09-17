module Spready
  class Ability
    include CanCan::Ability
    
    def initialize(user)
      @user = user || User.new # for guest
      send(@user.role)
    end

    def guest
      can :manage, :all
    end

    def member
    end

    def editor
    end

    def moderator
    end

    def administrator
      can :manage, :all
    end

  end
end