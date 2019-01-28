class Member < ApplicationRecord
  has_many :posts
  has_one :avatar
  accepts_nested_attributes_for :posts, reject_if: proc { |attributes| attributes["title"].blank? }, allow_destroy: true, limit: 3
  accepts_nested_attributes_for :avatar, update_only: :true
end
