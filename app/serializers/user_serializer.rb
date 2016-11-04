class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :created_at, :api_token, :password

  # def username
  #   object.username
  # end
  #
  # has_many :posts
  # has_many :comments
end
