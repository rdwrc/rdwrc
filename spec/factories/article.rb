FactoryGirl.define do

  factory :article do

    factory :highest_priority do
      name        'The Highest Priority - Cross-Cultural Evangelism'
      description 'Landmark article that changed perspective on unreached people'

      after(:create) do |article|
        article.user = FactoryGirl.create(:author)
        article.event = FactoryGirl.create(:icwe)
        article.categories << FactoryGirl.create(:published_papers)
      end
    end

  end

end
