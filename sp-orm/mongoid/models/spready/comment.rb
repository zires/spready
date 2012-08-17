class Spready::Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :uuid,    type: String

  recursively_embeds_many

  embedded_in :topic, class_name: 'Spready::Topic'

end
