class Forum
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name,     :type => String
  field :url_name, :type => String   # Name for url
  field :theme,    :type => String, :default => 'spready'

  embeds_many :category

end
