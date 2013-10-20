class Upload < ActiveRecord::Base
  has_many :articles, :dependent => :destroy, :inverse_of => :asset
  accepts_nested_attributes_for :articles, :allow_destroy => true

  attr_accessible :asset, :text

  # see https://github.com/thoughtbot/paperclip (must supply :styles or else processor will not run)
  #has_attached_file :asset, :styles => { :text => { :quality => :best } }, :processors => [:ocr]

  has_attached_file :asset
  has_attached_file :text
  after_save :convert_to_text

  def convert_to_text
    input_filename = asset.path
    output_filename = asset.path.chomp(File.extname(asset.path)) + '.txt'
    status = `/usr/local/bin/image_to_text '#{input_filename}' '#{output_filename}' 2>&1`
    status_code = $?
    if status_code.success?
      text = File.open(output_filename, 'r')
      # puts "Upload output filename is '#{output_filename}'"
    else
      text = nil
      puts "Upload error status is #{status_code}"
    end
  end
end
