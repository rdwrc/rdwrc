FactoryGirl.define do

  factory :user do

    factory :super_admin do
      name        'Mr. Super Admin'
      email       'super_admin@example.com'
      password    'Super Admin'
      admin       true
      editor      true
      author      true
      contributor true
    end

    factory :admin do
      name        'Mr. Admin'
      email       'admin@example.com'
      password    'I am an Admin'
      admin       true
      editor      false
      author      false
      contributor false
    end

    factory :editor do
      name        'Ms. Editor'
      email       'editor@example.com'
      password    'I am an Editor'
      admin       false
      editor      true
      author      false
      contributor false
    end

    factory :author do
      name        'Mr. Author'
      email       'author@example.com'
      password    'I am an Author'
      admin       false
      editor      false
      author      true
      contributor false
    end

    factory :contributor do
      name        'Mrs. Contributor'
      email       'contributor@example.com'
      password    'I am a Contributor'
      admin       false
      editor      false
      author      false
      contributor true
    end

    factory :normal_user do
      name        'Normal User'
      email       'user@example.com'
      password    'I am a Normal User'
      admin       false
      editor      false
      author      false
      contributor false
    end

  end

end
