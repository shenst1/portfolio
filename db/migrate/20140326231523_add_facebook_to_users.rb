class AddFacebookToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_uid, :string
    add_column :users, :facebook_name, :string
    add_column :users, :facebook_oauth_token, :string
    add_column :users, :facebook_oauth_expires_at, :datetime
  end
end
