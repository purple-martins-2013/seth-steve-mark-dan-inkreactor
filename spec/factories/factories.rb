FactoryGirl.define do

  factory :post do
    user
    sequence(:subject) { |n| "This is the subject for Post #{n}" }
    sequence(:content) { |n| "This is the content for Post #{n}" }
		ignore do
			comment_count 0
			tag_count     0
		end

    factory :post_with_comments do
      ignore do
        comment_count 5
      end

      before(:create) do |post, evaluator|
        create_list(:comment, evaluator.comment_count, post: post)
      end

    end

    factory :post_with_tags do
      ignore do
				tag_count 5
			end
    end
		before(:create) do |post, evaluator|
			create_list(:comment, evaluator.comment_count, post: post)
			# create_list(:tag, evaluator.comment_count, post: post)
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

	factory :tag do
		sequence(:name) {|n| "Tag Name #{n}"}
		posts {[create(:post)]}

		factory :invalid_tag do
			name ""
		end
	end


end
