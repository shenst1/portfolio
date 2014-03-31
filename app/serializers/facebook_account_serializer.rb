class FacebookAccountSerializer < ActiveModel::Serializer
  attributes :id, :oauth_token, :oauth_secret, :uid, :user, :provider, :name
end
