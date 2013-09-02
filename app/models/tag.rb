class Tag < ActiveRecord::Base
	has_and_belongs_to_many :posts

	validates :name, presence: true, length: { minimum: 1 }

	def to_param
  	name.parameterize
	end

	def self.posts_tagged_with(tag_name)
		self.find_by_name(tag_name).posts
	end

end
