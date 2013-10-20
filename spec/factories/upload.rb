FactoryGirl.define do
  factory :upload do
    text nil

    factory :image_file do
      asset File.open(Rails.root + 'spec/fixtures/LACC_bulletin.jpg')
    end

    factory :pdf_file do
      asset File.open(Rails.root + 'spec/fixtures/PERT_planning_Berlin.pdf')
    end
  end
end
