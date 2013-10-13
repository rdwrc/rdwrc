FactoryGirl.define do

  factory :user do

    factory :super_admin do
      name        'Mr. Super Admin'
      email       'super_admin@example.com'
      password    'Super Admin'

      after(:create) do |user, evaluator|
        user.roles << Role.find_or_create_by_code('admin', name: user.name) unless user.roles.map(&:code).include?('admin')
        user.roles << Role.find_or_create_by_code('editor', name: user.name + '(editor)') unless user.roles.map(&:code).include?('editor')
        user.roles << Role.find_or_create_by_code('author', name: user.name + '(author)') unless user.roles.map(&:code).include?('author')
        user.roles << Role.find_or_create_by_code('contributor', name: user.name + '(contributor)') unless user.roles.map(&:code).include?('contributor')
      end
    end

    factory :admin do
      name        'Mr. Admin'
      email       'admin@example.com'
      password    'I am an Admin'

      after(:create) do |user, evaluator|
        user.roles << Role.find_or_create_by_code('admin', name: user.name) unless user.roles.map(&:code).include?('admin')
      end
    end

    factory :editor do
      name        'Ms. Editor'
      email       'editor@example.com'
      password    'I am an Editor'

      after(:create) do |user, evaluator|
        user.roles << Role.find_or_create_by_code('editor', name: user.name) unless user.roles.map(&:code).include?('editor')
      end
    end

    factory :author do
      name        'Mr. Author'
      email       'author@example.com'
      password    'I am an Author'

      after(:create) do |user, evaluator|
        user.roles << Role.find_or_create_by_code('author', name: user.name) unless user.roles.map(&:code).include?('author')
      end
    end

    factory :contributor do
      name        'Mrs. Contributor'
      email       'contributor@example.com'
      password    'I am a Contributor'

      after(:create) do |user, evaluator|
        user.roles << Role.find_or_create_by_code('contributor', name: user.name) unless user.roles.map(&:code).include?('contributor')
      end
    end

    factory :normal_user do
      name        'Normal User'
      email       'user@example.com'
      password    'I am a Normal User'
    end

  end

end
