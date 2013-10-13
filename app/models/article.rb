class Article < ActiveRecord::Base
  attr_accessible :description, :name, :file

  belongs_to :event
  belongs_to :user

  has_and_belongs_to_many :categories

  acts_as_ordered_taggable

  has_attached_file :file
  after_post_process :convert_to_text

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

  def convert_to_text
    system("image_to_text.sh #{file}")
  end
end
