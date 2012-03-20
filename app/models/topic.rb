class Topic
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,   :type => String
  field :content, :type => String

  embedded_in :category
  embeds_many :comments
  belongs_to  :user
  
end
