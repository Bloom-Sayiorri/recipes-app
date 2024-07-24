class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :bio, :avatar
end
