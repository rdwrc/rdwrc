require 'geocoder'

class Location < ActiveRecord::Base
  attr_accessible :address, :city, :state, :zip, :country,
                  :latitude, :longitude

  has_many :events

  # see http://rdoc.info/github/alexreisner/geocoder/master/frames
  geocoded_by :full_street_address
  after_validation :geocode,
    :if => lambda{ |obj| obj.address_changed? ||
                         obj.city_changed? ||
                         obj.state_changed? ||
                         obj.zip_changed? ||
                         obj.country_changed?}

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.address = [geo.street_number, geo.route].join(' ') if geo.street_number && geo.route
      obj.city    = geo.city if geo.city
      obj.state   = geo.state_code if geo.state_code
      obj.zip     = geo.postal_code if geo.postal_code
      obj.country = geo.country if geo.country
    end
  end
  after_validation :reverse_geocode

  def location
    if latitude.nil? || longitude.nil?
      return nil
    end
    {:latitude => latitude, :longitude => longitude }
  end

  def full_street_address
    return [address, city, state, zip, country].compact.join(',')
  end

end
