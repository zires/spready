class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name,      :type => String
  field :uuid,      :type => Integer  # Who create or modify this category

  slug :name
  
  embedded_in :forum
  embeds_many :topics

end
