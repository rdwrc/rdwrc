class Article < ActiveRecord::Base
  attr_accessible :description, :name, :file

  belongs_to :event
  belongs_to :user

  has_and_belongs_to_many :categories

  acts_as_ordered_taggable

  has_attached_file :file
  after_post_process :convert_to_text

  def convert_to_text
    system("image_to_text.sh #{file}")
  end
end
