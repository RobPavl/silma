class Post < ApplicationRecord
  include Rails.application.routes.url_helpers
	belongs_to :category

	before_create do
      number_of_posts = Post.where(category_id: self.category_id).size
	  self.name = "Title #{number_of_posts + 1}"
	  
    end
    after_create_commit do
      self.url = post_url(self, host: 'localhost:3000')
      self.save!
    end
    scope :expired, -> { where('created_at <= ?', 15.minutes.ago) }

end
