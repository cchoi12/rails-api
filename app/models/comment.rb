# == Schema Information
#
# Table name: comments
#
#  id           :bigint(8)        not null, primary key
#  comment_body :text
#  rating       :integer
#  active       :boolean          default(FALSE)
#  author_id    :integer
#  doctor_id    :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :doctor

  validates :comment_body, presence: true
  validates :author_id, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
