require_relative '../spec_helper'

describe Article do

  subject { FactoryGirl.create :highest_priority }

  describe 'associations' do

    it 'should have all associations properly created' do
      subject.name.should eq 'The Highest Priority - Cross-Cultural Evangelism'

      subject.event.name.should eq 'The International Congress on World Evangelism'
      subject.event.description.should eq subject.event.name
      subject.event.date.should eq DateTime.new(1974, 7, 16)

      # see http://www.rubygeocoder.com
      subject.event.location.city.should eq 'Lausanne'
      subject.event.location.country.should eq 'Switzerland'
      subject.event.location[:latitude].to_f.should be_within(0.0005).of(46.5199617)
      subject.event.location[:longitude].to_f.should be_within(0.0005).of(6.6335971)

      subject.categories.size.should eq 1
      subject.categories.first.name.should eq 'Published Papers'
      subject.categories.first.description.should eq 'Papers that Ralph D. Winter published'

      # see https://github.com/mbleigh/acts-as-taggable-on
      @tags = "evangelism, cross-cultural, Christians, church, world, congregation"
      subject.tags.map(&:name).join(', ').should eq @tags
      subject.user.owned_tags.map(&:name).join(', ').should eq @tags

      # load a real PDF file
      subject.upload = FactoryGirl.create(:pdf_file)
      subject.upload.text.should_not be nil

      # load a real image file
      subject.upload = FactoryGirl.create(:image_file)
      subject.upload.text.should_not be nil

      # test different state transitions work correctly
      subject.state.should eq 'no_asset_exists'
      subject.upload_asset!
      subject.state.should eq 'asset_uploaded'
      subject.edit_asset!
      subject.state.should eq 'edited'
      subject.publish_asset!
      subject.state.should eq 'published'
    end
  end
end
