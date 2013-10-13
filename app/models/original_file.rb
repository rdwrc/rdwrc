class OriginalFile < ActiveRecord::Base
  has_many :articles, :dependent => :destroy, :inverse_of => :file
  accepts_nested_attributes_for :articles, :allow_destroy => true

  attr_accessible :file
  has_attached_file :file

  after_post_process :convert_to_text

  def convert_to_text
    system("image_to_text.sh #{file}")
  end
end
