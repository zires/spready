class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name, :type => String
  field :uuid, :type => Integer  # Who create or modify this category

  slug :name
  
  belongs_to :forum
  has_many :topics

end
