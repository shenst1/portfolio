class CreateTwitterData < ActiveRecord::Migration
  def change
    create_table :twitter_data do |t|
      t.string :tweet
      t.string :favorites

      t.timestamps
    end
  end
end
