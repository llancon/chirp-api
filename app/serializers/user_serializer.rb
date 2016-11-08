class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :created_at, :api_token, :avatar_id, :id, :followers_count, :followees_count
  has_many :followers
  has_many :posts


  def avatar
    if avatar_id == null
      'https://robohash.org/' + "#{object.username}"
    else
      Refile.attachment_url(object, :avatar, :fit, 50, 50, format: "jpg")
    end
  end

  def followers
    object.followers(User)
  end


end
