FactoryBot.define do
  factory :order_address do
    zip_code         {"111-1111"}
    prefecture_id    {2}
    city             {"さいたま市さいたま町"}
    house_number     {"１丁目"}
    phone_number     { "09012345678" }
    token            {111111}
  end
end
