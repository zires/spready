class Spready::Category
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :uuid, type: String  # Who create or modify this category

  embedded_in :forum, class_name: 'Spready::Forum'

  has_many :topics, class_name: 'Spready::Topic'

end
