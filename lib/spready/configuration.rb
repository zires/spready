# encoding: utf-8
require 'ostruct'

module Spready
  class Configuration
    
    # Options
    #   orm: mongoid, active_record, nil. Default is nil.
    #   user: OpenStruct.new(:user_class => :User, 
    #                        :authenticate_method => :authenticate_user!,
    #                        :provider => :devise
    #                        :roles => [:administrator, :moderator, :editor, :member, :guest])
    attr_accessor :orm, :user

    def initialize
      # Default settings
      @user = OpenStruct.new(:user_class => :User, :authenticate_method => :authenticate_user!, :provider => :devise)
    end

  end
end
