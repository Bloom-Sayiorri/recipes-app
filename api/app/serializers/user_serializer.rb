class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :avatar, :bio, :admin
end
