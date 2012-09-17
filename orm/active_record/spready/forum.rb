module Spready
  class Forum
    include Mongoid::Document
    include Mongoid::Timestamps
  
    field :name,  type: String
    field :theme, type: String, default: 'spready'

    embeds_many :categories

    has_one :moderator # Who create or modify this forum

    validates :name, presence: true, uniqueness: true

  end
end
