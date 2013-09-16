class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name

  belongs_to :location
  has_many :articles
end
