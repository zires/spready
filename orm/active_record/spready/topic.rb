module Spready
  class Topic
    include Mongoid::Document
    include Mongoid::Timestamps

    field :title,   type: String
    field :content, type: String
    field :uuid,    type: String # Who create or modify this topic

    belongs_to :category

    embeds_many :comments

  end
end
