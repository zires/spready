class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Token

  field :content,   :type => String
  field :uuid,      :type => Integer

  embedded_in :topic
  embeds_many :comments
  embedded_in :comment

  token :length => 6
end
