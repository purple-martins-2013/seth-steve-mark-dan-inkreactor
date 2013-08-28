FactoryGirl.define do

  factory :post do
    sequence(:subject) { |n| "This is the subject for Post #{n}" }
    sequence(:content) { |n| "This is the content for Post #{n}" }
  end

end
