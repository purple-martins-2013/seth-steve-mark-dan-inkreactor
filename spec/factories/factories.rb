FactoryGirl.define do

  factory :post do
    user
    sequence(:subject) { |n| "This is the subject for Post #{n}" }
    sequence(:content) { |n| "This is the content for Post #{n}" }

    factory :post_with_comments do
      ignore do
        comment_count 5
      end

      before(:create) do |post, evaluator|
        FactoryGirl.create_list(:comment, evaluator.comment_count, post: post)
      end

    end
  end

  factory :comment do
    sequence(:content) {|n| "This is the content for the Post comment #{n}"}
    user
    post
  end

  factory :user do
    sequence(:email) { |n| "Person#{n}@email.com"}
    sequence(:username) { |n| "Person#{n}"}
    password 'password'

  end

end
