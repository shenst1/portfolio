class TwitterAccountSerializer < ActiveModel::Serializer
  attributes :id, :oauth_token, :oauth_secret
end
