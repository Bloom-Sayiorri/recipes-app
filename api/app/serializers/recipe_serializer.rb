class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :country_of_origin, :serving, :ingredients, :instructions, :date_time
  has_one :user
end
