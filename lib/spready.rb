# encoding: utf-8
require 'active_support/core_ext/module/delegation'

module Spready
  autoload :Configuration, 'spready/configuration'

  # Setup and return itself
  def self.setup
    yield config if block_given?
    self
  end

  class << self
    
    delegate :orm, :to => :config

    delegate :user_class, :authenticate_method, :to => :user

    def config
      @@config ||= Spready::Configuration.new
    end

    def user
      config.user
    end

    def use_devise?
      user.provider.to_s == 'devise'
    end

  end

end

require "spready/engine" if defined?(Rails)
