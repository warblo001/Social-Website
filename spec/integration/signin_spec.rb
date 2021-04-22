require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Creating a user and associated object' do
    it 'sucessfully creates a new user' do
      user = User.new(id: 1, name: 'username', email: 'username@gmail.com', password: 'password')
      expect(user.valid?).to eq(true)
    end
    it 'fails to create a new user' do
      user = User.new(name: 'Username')
      expect(user.valid?).to eq(false)
    end
    it 'sucessfully creates a new Post from a user' do
      user = User.new(id: 1, name: 'username', email: 'username@gmail.com', password: 'password')
      post = user.posts.build(content: 'Some specific content')
      expect(post.valid?).to eq(true)
    end
    it 'Does not creates a new Post from a user' do
      user = User.new(id: 1, name: 'username', email: 'username@gmail.com', password: 'password')
      post = user.posts.build
      expect(post.valid?).to eq(false)
    end
  end
end
