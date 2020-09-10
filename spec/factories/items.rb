require 'faker'
FactoryBot.define do
  factory :item do
    association :user              
    name                 {"ノートパソコン"}
    description          {"ノートパソコンです"}
    category_id          {2}
    condition_id         {2}
    postage_payer_id     {2}
    prefecture_id        {2}
    sending_time_id      {2}
    price                {1000}
    after(:build) do |g|
      g.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
