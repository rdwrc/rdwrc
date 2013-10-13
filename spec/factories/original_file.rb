FactoryGirl.define do
  factory :original_file do

    factory :image_file do
      file File.open(Rails.root + 'spec/fixtures/LACC_bulletin.jpg')
    end

    factory :pdf_file do
      file File.open(Rails.root + 'spec/fixtures/PERT_planning_Berlin.pdf')
    end
  end
end
