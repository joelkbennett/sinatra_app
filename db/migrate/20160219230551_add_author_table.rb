class AddAuthorTable < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :username
      t.timestamps
    end
  end
end
