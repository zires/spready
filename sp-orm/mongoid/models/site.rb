class Site
  include Singleton

  include Mongoid::Document

  field :subdomain,        :type => Boolean, :default => false      # Use subdomain or not.
  field :specifical_index, :type => Boolean, :default => false      # Use specifical index page or not. If it's true, '/' will redirect to 'welcome#index'.
  field :forum_id,         :type => String                          # Default forum. If it's nil, will be the first forum
  field :theme,            :type => String,  :default => 'spready'  # Default theme
  
  private_class_method :create

  # serialized attributes for cache.
  cattr_reader :settings

  @@__instance = nil

  # When Site.instance be saved, need refresh settings.
  after_save :reload_settings

  class << self

    def initialize!
      Site.instance
      @@settings = YAML.load(@@__instance.attributes.to_yaml)
    end

    def instance
      return @@__instance if @@__instance
      Mutex.new.synchronize do
        @@__instance = self.first || create
      end
    end

    def forum
      Forum.find(forum_id)
    end

  end

  protected
  
  def reload_settings
    @@settings = YAML.load(@@__instance.attributes.to_yaml) if @@__instance
  end

  private
  # Use method missing to do like Site.subdomain.
  def self.method_missing(method, *args, &block)
    begin
      settings[method.to_s]
    rescue Exception => e
      super
    end
  end

end

# Initialize site
Site.initialize!
