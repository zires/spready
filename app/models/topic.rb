class Topic
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,     :type => String
  field :content,   :type => String
  field :user_uuid, :type => Integer

  embedded_in :category
  embeds_many :comments
  
end
