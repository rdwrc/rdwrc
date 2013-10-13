class Article < ActiveRecord::Base
  attr_accessible :description, :name, :original_file

  belongs_to :event
  belongs_to :user

  belongs_to :original_file
  accepts_nested_attributes_for :original_file, :allow_destroy => true

  has_and_belongs_to_many :categories

  acts_as_ordered_taggable

  state_machine :initial => :no_file_exists do
    state :no_file_exists
    state :file_uploaded
    state :edited
    state :published

    event :upload_file! do
      transition [:no_file_exists] => :file_uploaded
    end
    event :edit_file! do
      transition [:file_uploaded] => :edited
    end
    event :publish_file! do
      transition [:edited] => :published
    end
  end
end
