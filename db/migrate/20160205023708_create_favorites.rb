class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites, id: false do |t|
      t.integer :id
      t.integer :tweet_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :favorites, [:tweet_id, :user_id], unique: true, name: 'TWEET_ID_USER_ID_UNIQUE'
  end
end
