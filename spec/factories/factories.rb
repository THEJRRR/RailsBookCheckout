
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@lala.lala"}
    password '12345678'

  end

  factory :admin, class: User do
    after(:create) { |user| user.add_role 'admin'}
    email 'admin@lala.lala'
    password '12345678'
  end

  factory :book do
    author 'Judy Bloom'
    title 'Blubber'
  end

  factory :book_review do
    content "MyText"
    user nil
    book nil
  end

end



