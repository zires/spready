module Spready
  class Category
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name, type: String
    field :uuid, type: String  # Who create or modify this category

    embedded_in :forum

    has_many :topics
    
  end
end
