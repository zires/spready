module Spready
  class Category
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,     :type => String
    field :forum_id, :type => String

    has_many    :topics,  :class_name => 'Spready::Topic'
    belongs_to  :creater, :class_name => Spready.user_class.to_s
    embedded_in :forum,   :class_name => 'Spready::Forum'
    
    #TODO: same forum have uniqueness name
    validates :name, :presence => true, :uniqueness => true

    validates :forum_id, :presence => true

  end
end
