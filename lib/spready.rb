require 'active_support/core_ext/module/delegation'
require 'spready/configuration'

module Spready
  
  def self.setup
    yield config if block_given?
  end

  class << self
    
    delegate :orm, :user_class, :user_roles, :user_provider, :authenticate_method, :theme, :to => :config

    def config
      @@config ||= Spready::Configuration.new
    end

    def use_devise?
      user_provider.to_s == 'devise'
    end

  end

end

require "spready/engine" if defined?(Rails)
