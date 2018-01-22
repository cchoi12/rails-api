require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:doctor) }

  it { should validate_presence_of(:comment_body) }
  it { should validate_presence_of(:author_id) }

  [1, 2, 3, 4, 5].each do |rating|
    it { should allow_value(rating).for(:rating)}
  end
end
