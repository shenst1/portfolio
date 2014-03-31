class CreateFacebookAccounts < ActiveRecord::Migration
  def change
    create_table :facebook_accounts do |t|
      t.string :oauth_token
      t.string :oauth_secret
      t.string :uid
      t.string :user
      t.string :provider
      t.string :name

      t.timestamps
    end
  end
end
