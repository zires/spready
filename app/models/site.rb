class Site
  include Singleton

  include Mongoid::Document

  field :subdomain,        :type => Boolean, :default => false      # Use subdomain or not.
  field :specifical_index, :type => Boolean, :default => false      # Use specifical index page or not. If it's true, '/' will redirect to 'welcome#index'.
  field :forum,            :type => String                          # Default forum. If it's nil, will be the first forum
  field :theme,            :type => String,  :default => 'spready'  # Default theme
  
  # Use method missing to do like Site.subdomain.
  def self.method_missing(method, *args, &block)
    if instance.respond_to?(method)
      instance.send method.to_sym
    else
      super
    end
  end

end
