class Post < ApplicationRecord
  belongs_to :member, inverse_of: :posts
  validates_presence_of :member
end

