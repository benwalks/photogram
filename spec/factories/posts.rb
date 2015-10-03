FactoryGirl.define do
  factory :post do
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/coffee.jpg', 'image/jpg')
    user_id 1
  end
end
