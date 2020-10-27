FactoryBot.define do
  factory :user do
    nickname {"tes"}
    email {"tes@tes"}
    password {"aaa111"}
    password_confirmation {"aaa111"}
    sur_name {"山田"}
    name {"武"}
    sur_name_ruby {"ヤマダ"}
    name_ruby {"タケシ"}
    date {1990-01-01}
  end
end