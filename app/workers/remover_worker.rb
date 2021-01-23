class RemoverWorker
  include Sidekiq::Worker

  def perform(*args)
  	Post.expired.each do |post|
  	  if post.active == true
  	    post.url    = nil
  	 	post.active = false
  	 	post.save
        puts 'this shit is done'
      end
    end   
  end
end
