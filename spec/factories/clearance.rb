FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    username 'test_user'
    email 'test@mail.com'
    password 'password'
  end
end
