FactoryGirl.define do

  factory :event do

    factory :mission_meeting do
      name        'Missiology gathering'
      description 'This is the first missiology meeting of the year'
      date        '2013-01-02 03:04:05'

      after(:create) do |event|
        event.location = FactoryGirl.create(:uscwm)
      end
    end

    factory :board_meeting do
      name        'Meeting of the Board'
      description 'This is the second board meeting of the year'
      date        '2013-11-10 09:08:07'

      after(:create) do |event|
        event.location = FactoryGirl.create(:fuller)
      end
    end

    factory :icwe do
      name        'The International Congress on World Evangelism'
      date        '1974-07-16'

      after(:create) do |event|
        event.description = event.name
        event.location = FactoryGirl.create(:lausanne)
      end
    end

  end

end
