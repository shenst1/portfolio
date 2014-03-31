class AddDataToTwitterAccounts < ActiveRecord::Migration
  def change
    add_column :twitter_accounts, :user, :string
    add_column :twitter_accounts, :provider, :string
    add_column :twitter_accounts, :uid, :string
    add_column :twitter_accounts, :name, :string
  end
end
