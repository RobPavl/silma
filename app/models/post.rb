class Post < ApplicationRecord
  include Rails.application.routes.url_helpers
	belongs_to :category

	before_create do
	  last_category_post = Post.where(category_id: self.category_id).last

	  if last_category_post == nil
	  	number_of_last_post = 0
	  else	
        number_of_last_post = last_category_post.name.scan(/\d/).join('').to_i
      end  

	  self.name = "Title #{number_of_last_post + 1}"
    end

    after_create_commit do
      self.url = post_url(self, host: 'localhost:3000')
      self.save!
    end
    
    scope :expired, -> { where('created_at <= ?', 15.minutes.ago) }

end
