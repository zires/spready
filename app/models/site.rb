class Site
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  field :name,  :type => String
  field :theme, :type => String, :default => 'spready'

  has_many :categories

  slug :name

end
