module Spready
  class Forum
    include Mongoid::Document
    include Mongoid::Timestamps
  
    field :name,  :type => String
    field :theme, :type => String, :default => 'spready'

    embeds_many :categories, :class_name => 'Spready::Category'

    # Who create this forum
    belongs_to :creater, :class_name => Spready.user_class.to_s

    validates :name, :presence => true, :uniqueness => true

  end
end
