class CreateReviewSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :review_songs do |t|
      t.integer :user_id
      t.integer :song_id
      t.text :review

      t.timestamps
    end
  end
end
