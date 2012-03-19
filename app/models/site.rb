class Site
  include Singleton

  include Mongoid::Document
  include Mongoid::Timestamps

  field :subdomain,        :type => Boolean, :default => false        # Use subdomain or not
  field :theme,            :type => String,  :default => 'default'    # Global theme
  field :specifical_index, :type => Boolean, :default => false        # Use specifical index page or not. If it's true, '/' will redirect to 'welcome#index'

end
