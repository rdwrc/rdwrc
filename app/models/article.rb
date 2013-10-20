class Article < ActiveRecord::Base
  attr_accessible :description, :name, :upload

  belongs_to :event
  belongs_to :user

  belongs_to :upload
  accepts_nested_attributes_for :upload, :allow_destroy => true

  has_and_belongs_to_many :categories

  acts_as_ordered_taggable

  state_machine :initial => :no_asset_exists do
    state :no_asset_exists
    state :asset_uploaded
    state :edited
    state :published

    event :upload_asset! do
      transition [:no_asset_exists] => :asset_uploaded
    end
    event :edit_asset! do
      transition [:asset_uploaded] => :edited
    end
    event :publish_asset! do
      transition [:edited] => :published
    end
  end
end
