class Comment < ApplicationRecord
  belongs_to :doctor

  validates :comment_body, presence: true
  validates :author_id, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
