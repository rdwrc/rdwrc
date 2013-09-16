require_relative '../spec_helper'

describe Article do

  subject { FactoryGirl.create :highest_priority }

  describe 'associations' do

    it 'should have all associations properly created' do
      subject.name.should eq 'The Highest Priority - Cross-Cultural Evangelism'

      subject.event.name.should eq 'The International Congress on World Evangelism'
      subject.event.description.should eq subject.event.name
      subject.event.date.should eq DateTime.new(1974, 7, 16)

      subject.event.location.city.should eq 'Lausanne'
      subject.event.location.country.should eq 'Switzerland'
      subject.event.location[:latitude].to_f.should be_within(0.0005).of(46.5199617)
      subject.event.location[:longitude].to_f.should be_within(0.0005).of(6.6335971)

      subject.categories.size.should eq 1
      subject.categories.first.name.should eq 'Published Papers'
      subject.categories.first.description.should eq 'Papers that Ralph D. Winter published'
    end
  end
end
