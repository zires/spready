require 'active_support/hash_with_indifferent_access'

module Spready
  class Configuration
    
    attr_accessor :orm, :user_class, :user_roles, :user_provider, :authenticate_method, :theme

    def initialize
      @orm   = :active_record
      @theme = :spready
      @user_class    = :User
      @user_provider = :devise
      @user_roles = [:administrator, :moderator, :editor, :member, :guest]
      @authenticate_method = :authenticate_user!
    end

  end
end
