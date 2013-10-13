FactoryGirl.define do
  factory :role do
    code "guest"
    name "Guest"

    factory :admin_role do
      code 'admin'
      name 'Admin'
    end

    factory :editor_role do
      code 'editor'
      name 'Editor'
    end

    factory :author_role do
      code 'author'
      name 'Author'
    end

    factory :contributor_role do
      code 'contributor'
      name 'Contributor'
    end
  end
end
