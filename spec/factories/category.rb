FactoryGirl.define do

  factory :category do

    factory :published_papers do
      name        'Published Papers'
      description 'Papers that Ralph D. Winter published'
    end

    factory :unpublished_papers do
      name        'Unpublished Papers'
      description 'Papers that Ralph D. Winter wrote but did not publish'
    end

    factory :letters do
      name        'Letters'
      description 'Letters that Ralph D. Winter wrote'
    end

    factory :other_materials do
      name        'Other Material'
      description 'Other material that Ralph D. Winter wrote'
    end

    factory :audio do
      name        'Audio Presentations'
      description 'Audio recordings of Ralph D. Winter'
    end

    factory :videos do
      name        'Video Presentations'
      description 'Videos of Ralph D. Winter'
    end

    factory :photographs do
      name        'Photographs'
      description 'Photographs of Ralph D. Winter'
    end

    factory :related do
      name        'Related materials'
      description 'Related materials to Ralph D. Winter'
    end

  end

end

