# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book_review do
    content "MyText"
    user nil
    book nil
  end
end
