class Article < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :event
  belongs_to :user

  has_and_belongs_to_many :categories

  acts_as_ordered_taggable
end
