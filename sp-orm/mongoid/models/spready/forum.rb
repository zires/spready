class Spready::Forum
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name,  type: String
  field :uuid,  type: String
  field :theme, type: String, default: 'spready'

  embeds_many :categories, class_name: "Spready::Category"

  validates :name, presence: true, uniqueness: true
  validates :uuid, presence: true

end
