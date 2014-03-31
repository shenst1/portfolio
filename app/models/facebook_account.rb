class FacebookAccount < ActiveRecord::Base
    def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |account|
        account.provider = auth.provider
        account.uid = auth.uid
        account.name = auth.info.name
        account.oauth_token = auth.credentials.token
        account.oauth_secret = auth.credentials.secret
        account.save!
      end
    end

    def self.create_from_omniauth(auth)
      create! do |account|
        account.provider = auth.provider
        account.uid = auth.uid
        account.name = auth.info.nickname
        account.oauth_token = auth.credentials.token
        account.oauth_secret = auth.credentials.secret
      end
    end

    # def instantiate_facebook
    #   if provider == "twitter"
    #     @twitter ||= Twitter::Client.new(oauth_token: twitter_oauth_token, oauth_token_secret: twitter_oauth_secret)
    #   end
    # end

end
