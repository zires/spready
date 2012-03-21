class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,      :type => String
  field :url_name,  :type => String   # Name for url
  field :user_uuid, :type => Integer  # Who create or modify this category

  embedded_in :forum
  embeds_many :topics

end
