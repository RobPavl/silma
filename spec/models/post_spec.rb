require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context 'scope texts' do
  	
  	it 'ensures first post name' do
  	  post = Post.new.save
      expect(post.name).to eq('Title 1') 
    end

    it 'ensures multiple posts name' do
  	  post1 = Post.new.save
  	  post2 = Post.new.save
      expect(post1.name).to eq('Title 2')
      expect(post2.name).to eq('Title 3')  
    end
  end

end
