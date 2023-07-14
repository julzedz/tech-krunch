class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  after_create :increment_comment_count
  after_destroy :decrement_comment_count

  def increment_comment_count
    puts 'Incrementing comment count'
    posts.increment!(:comment_count)
  end

  def decrement_comment_count
    puts 'Decrementing comment count'
    posts.decrement!(:comment_count)
  end
end
