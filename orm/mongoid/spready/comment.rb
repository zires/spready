module Spready
  class Comment
    include Mongoid::Document
    include Mongoid::Timestamps

    field :content, :type => String

    recursively_embeds_many

    belongs_to :user, :class_name => Spready.user_class.to_s

    embedded_in :topic, :class_name => 'Spready::Topic'

  end
end
