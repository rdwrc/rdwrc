# see http://grinnick.com/posts/how-to-test-the-ruby-geocoder-gem
# see https://developers.google.com/maps/documentation/geocoding/?csw=1
# see http://samuelmullen.com/2012/02/testing-geocoder-with-rspec-and-cucumber/
module Geocoder
  module Lookup
    class Base
      private
      def read_fixture(file)
        # specify the directory where you saved your json file
        File.read(File.join("spec", "fixtures", "geocoder", file)).strip.gsub(/\n\s*/, "")
      end
    end

    class Google < Base
      private
      def fetch_raw_data(query, reverse = false)
        raise TimeoutError if query == "timeout"
        raise SocketError if query == "socket_error"

        case query
          when "no results";   :no_results
          when "no locality";  :no_locality
          when "no city data"; :no_city_data
          else
            text_query = query.text
            if query.text.is_a?(Array) && query.text.size == 2
              text_query = "#{query.text[0].to_f.round(6)},#{query.text[1].to_f.round(6)}"
            end
            text_query.strip!

            case text_query
            when 'Holly Springs,27540',
                 'Holly Springs,NC,27540,United States',
                 '35.651266,-78.833622'
              read_fixture 'google_data_rms.json'

            when '1605 E Elizabeth St.,Pasadena,CA,91104,United States',
                '34.174259,-118.117683'
              read_fixture 'google_data_uscwm.json'

            when 'Lausanne,Switzerland',
                 '46.519962,6.633597'
              read_fixture 'google_data_icwe.json'
            else
              raise "query text requires new JSON file : #{text_query}"
            end
        end
      end
    end
  end
end
