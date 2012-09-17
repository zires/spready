module Spready
  class Topic
    include Mongoid::Document
    include Mongoid::Timestamps

    field :title,   :type => String
    field :content, :type => String

    belongs_to :user, :class_name => Spready.user_class.to_s
    belongs_to :category, :class_name => 'Spready::Category'

    embeds_many :comments, :class_name => 'Spready::Comment'

  end
end
