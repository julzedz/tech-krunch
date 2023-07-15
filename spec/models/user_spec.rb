# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      user = User.new(name: 'Jim Smith')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include('name is required')
    end

    it 'is valid with a post_counter greater than or equal to 0' do
      user = User.new(name: 'Jim Smith', posts_counter: 0)
      expect(user).to be_valid
    end

    it 'is invalid with a negative post_counter' do
      user = User.new(name: 'Jim Smith', posts_counter: -1)
      expect(user).not_to be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end
  end

  describe '#most_recent_posts' do
    it 'returns the three most recent posts' do
      user = User.create(name: 'John Doe')
      post1 = user.posts.create(title: 'Post 1', created_at: 3.days.ago)
      post2 = user.posts.create(title: 'Post 2', created_at: 2.days.ago)
      post3 = user.posts.create(title: 'Post 3', created_at: 1.day.ago)
      user.posts.create(title: 'Post 4', created_at: 4.days.ago)

      most_recent_posts = user.most_recent_posts

      expect(most_recent_posts).to match_array([post3, post2, post1])
    end
  end
end
