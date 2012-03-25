class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Token

  field :title,     :type => String
  field :content,   :type => String
  field :uuid,      :type => Integer

  embedded_in :category
  embeds_many :comments

  token :length => 6
  
end
