class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :about
      t.string :url
      t.string :tools
      t.string :feedback

      t.timestamps
    end
  end
end
