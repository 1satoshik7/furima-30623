FactoryBot.define do
  factory :user_order do
    postal_code {"123-4567"}
    prefecture_id {2}
    city {"清瀬市"}
    house_number {"1-1-1"}
    tell {"09012345678"}
    token {"sampletokensampletoken"}
  end
end
