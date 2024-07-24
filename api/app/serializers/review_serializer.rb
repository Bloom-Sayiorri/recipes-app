class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment
  has_one :recipe
  has_one :user
end
