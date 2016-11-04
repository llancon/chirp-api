class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :created_at, :api_token

  def avatar
    Refile.attachment_url(object, :avatar, :fit, 100, 100, format: "jpg")
  end
  # def username
  #   object.username
  # end
  #
  # has_many :posts
  # has_many :comments
end
