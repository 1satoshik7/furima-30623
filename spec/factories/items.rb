FactoryBot.define do
  factory :item do
    name {"tes"}
    description {"tes"}
    category_id {2}
    product_status_id {2}
    price {500}
    freight_id {2}
    shiptoaddress_id {2}
    shipdate_id {2}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/https://sozai.site/wp-content/uploads/2016/11/Icons8-220x150.png'), filename: 'https://sozai.site/wp-content/uploads/2016/11/Icons8-220x150.png')
    end
    association :user
  end
end
