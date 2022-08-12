FactoryBot.define do
  factory :item do

    name                 {'あああ'}
    text                 {'あああ'}
    category_id          {'2'}
    condition_id         {'2'}
    charge_bearer_id     {'2'}
    shipping_area_id     {'2'}
    delivary_day_id      {'2'}
    price                {'300'}
    # user_id              {'1'}
    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
