module Paperclip
  class Ocr < Processor

    include Paperclip::Logger

    # file.content_type = "application/pdf"
    # file.size = 68863
    # file.original_filename = "PERT_planning_Berlin.pdf"
    # file.path.inspect = "/var/folders/kj/l8094tpd5659sd1vwdy2c0xr0000gp/T/PERT_planning_Berlin20131016-18369-1km96w2.pdf"
    # attachment.instance = Upload.rb class
    # options = {:quality=>:best, :processors=>[:ocr], :whiny=>true, :convert_options=>"", :source_file_options=>""}
    def make
      begin
        output_filename = file.path.chomp(File.extname(file.path)) + '.txt'

        puts "Path to file: #{file.path.inspect}"
        puts "Output file: #{output_filename}"

        Paperclip.run('image_to_text', file.path, output_filename)

        File.open(file.path.chomp(File.extname(file.path)) + '.txt', "r")

      rescue StandardError => e
        raise Error, "There was an error processing the file contents for #{@basename} - #{e}"
      end
    end
  end
end
