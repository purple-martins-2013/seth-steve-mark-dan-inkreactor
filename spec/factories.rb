FactoryGirl.define do

  factory :post do
    sequence(:subject) { |n| "This is the subject for Post #{n}" }
    sequence(:content) { |n| "This is the content for Post #{n}" }
  end

  factory :user do
    sequence(:email) { |n| "Person#{n}@email.com"}
    sequence(:username) { |n| "Person#{n}"}
    password 'password'
  end

end
