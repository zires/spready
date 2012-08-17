class Spready::Topic
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,   type: String
  field :content, type: String
  field :uuid,    type: String

  belongs_to :category, class_name: 'Spready::Category'

  embeds_many :comments, class_name: 'Spready::Comment'

end
