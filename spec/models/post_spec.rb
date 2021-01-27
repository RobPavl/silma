require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @category = Category.create(name: "New Category")
  end

  context 'scope categories' do
  	
  	it 'ensures first post name' do
  	  post = Post.create(category_id: @category.id)
      expect(post.name).to eq('Title 1') 
    end

    it 'ensures multiple posts names' do
  	  post1 = Post.create(category_id: @category.id)
  	  post2 = Post.create(category_id: @category.id)
      
      expect(post1.name).to eq('Title 1')
      expect(post2.name).to eq('Title 2')  
    end

    it 'ensures that names of post for different categories will have different index' do
      @second_category = Category.create(name: 'Second Category')
      
      post1 = Post.create(category_id: @category.id)
      post2 = Post.create(category_id: @category.id)
      second_category_post = Post.create(category_id: @second_category.id)
      
      expect(post1.name).to eq('Title 1')
      expect(post2.name).to eq('Title 2') 
      expect(second_category_post.name).to eq('Title 1') 
    end

    it 'ensures that after deleting the last post, the newly created post will have the same name' do
      post_1 = Post.create(category_id: @category.id)
      post_2 = Post.create(category_id: @category.id)

      post_2.destroy
      post_3 = Post.create(category_id: @category.id)
      
      expect(post_1.name).to eq('Title 1')
      expect(post_3.name).to eq('Title 2')
    end

#check this case on running app
    it 'ensures that after deleting the middle post, the newly created post will have the latest index in name' do
      post_1 = Post.create(category_id: @category.id)
      post_2 = Post.create(category_id: @category.id)
      post_3 = Post.create(category_id: @category.id)

      post_2.destroy
      post_4 = Post.create(category_id: @category.id)
      
      expect(post_1.name).to eq('Title 1')
      expect(post_3.name).to eq('Title 3')
      expect(post_4.name).to eq('Title 4')
    end

  end

  after(:all) do
    Category.all.destroy
    Post.all.destroy
  end

end
