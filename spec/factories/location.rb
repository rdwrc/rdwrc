FactoryGirl.define do

  factory :location do

    factory :uscwm do
      address   '1605 E Elizabeth St.'
      city      'Pasadena'
      state     'CA'
      zip       '91104'
      country   'United States'
      latitude  34.174259
      longitude -118.117683
    end

    factory :fuller do
      address   '135 N Oakland Ave'
      city      'Pasadena'
      state     'CA'
      zip       '91101'
      country   'United States'
      latitude  34.147997
      longitude -118.140283
    end

    factory :lausanne do
      city      'Lausanne'
      country   'Switzerland'
      latitude  46.5199617
      longitude 6.6335971
    end

    factory :missing_gps_location do
      city      'Holly Springs'
      zip       '27540'
    end

  end

end
