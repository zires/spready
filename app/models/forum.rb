class Forum
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name,     :type => String
  field :url_name, :type => String   # Name for url

  embeds_many :category
  belongs_to  :site

end
