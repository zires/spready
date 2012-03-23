class Site
  include Singleton

  include Mongoid::Document

  field :subdomain,        :type => Boolean, :default => false      # Use subdomain or not.
  field :specifical_index, :type => Boolean, :default => false      # Use specifical index page or not. If it's true, '/' will redirect to 'welcome#index'.
  field :forum,            :type => String                          # Default forum. If it's nil, will be the first forum
  field :theme,            :type => String,  :default => 'spready'  # Default theme
  
  private_class_method :create

  @@__instance = nil

  def self.instance
    return @@__instance if @@__instance
    Mutex.new.synchronize do
      @@__instance = self.first || create()
    end
  end

  # serialized attributes for cache.
  cattr_reader :settings

  # When Site.instance be saved, need refresh settings.
  after_save :reload_settings

  # Use method missing to do like Site.subdomain.
  def self.method_missing(method, *args, &block)
    if settings.key?(method.to_s)
      settings[method.to_s]
    else
      super
    end
  end

  protected
  
  def reload_settings
    @@settings = YAML.load(@@__instance.attributes.to_yaml)
  end

end
