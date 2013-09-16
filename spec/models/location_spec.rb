require_relative '../spec_helper'

describe Location do

  describe 'all information is valid initially' do
    subject { FactoryGirl.create :uscwm }

    it 'should have all valid fields including GPS location' do
      subject.address.should match /^\s*1605.*E.*Elizabeth.*St.*$/
      subject.city.should eq 'Pasadena'
      subject.state.should eq 'CA'
      subject.zip.should eq '91104'

      subject.location[:latitude].should eq 34.174259
      subject.location[:longitude].should eq -118.117683
      subject.latitude.should eq 34.174259
      subject.longitude.should eq -118.117683
    end
  end

  describe 'reverse geocode should result in same Lat/Long' do
    subject { FactoryGirl.create :uscwm }

    it 'should get same information when Geocoding' do
      subject.reverse_geocode

      subject.address.should match /^\s*1605.*E.*Elizabeth.*St.*$/
      subject.city.should eq 'Pasadena'
      subject.state.should eq 'CA'
      subject.zip.should eq '91104'

      # GPS location should be unchanged
      subject.location[:latitude].should eq 34.174259
      subject.location[:longitude].should eq -118.117683
      subject.latitude.should eq 34.174259
      subject.longitude.should eq -118.117683
    end
  end

  describe 'missing GPS location should be added automatically' do
    subject { FactoryGirl.create :missing_gps_location }

    it 'should have no GPS location' do
      subject.address.should be_nil
      subject.city.should eq 'Holly Springs'
      subject.state.should eq 'NC'
      subject.zip.should eq '27540'
      subject.latitude.to_f.should be_within(0.0005).of(35.651521)
      subject.longitude.to_f.should be_within(0.0005).of(-78.8336218)
      subject.location[:latitude].to_f.should be_within(0.0005).of(35.651521)
      subject.location[:longitude].to_f.should be_within(0.0005).of(-78.8336218)
    end
  end

  describe 'geocode should add correct GPS location' do
    subject { FactoryGirl.create :missing_gps_location }

    it 'should Geocode to get correct Lat/Long values' do
      subject.geocode

      subject.address.should be_nil
      subject.city.should eq 'Holly Springs'
      subject.state.should eq 'NC'
      subject.zip.should eq '27540'
      subject.latitude.to_f.should be_within(0.0005).of(35.651521)
      subject.longitude.to_f.should be_within(0.0005).of(-78.8336218)
      subject.location[:latitude].to_f.should be_within(0.0005).of(35.651521)
      subject.location[:longitude].to_f.should be_within(0.0005).of(-78.8336218)
    end
  end

  describe 'Geocode empty address' do
    subject { Location.new }

    it 'should not update any fields' do
      subject.geocode

      subject.address.should be_nil
      subject.city.should be_nil
      subject.state.should be_nil
      subject.zip.should be_nil
      subject.latitude.should be_nil
      subject.longitude.should be_nil
      subject.location.should be_nil
    end
  end

end
