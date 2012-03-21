class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content,   :type => String
  field :user_uuid, :type => Integer

  embedded_in :topic
  embeds_mang :comments
  embedded_in :comment
  belongs_to  :user

end
