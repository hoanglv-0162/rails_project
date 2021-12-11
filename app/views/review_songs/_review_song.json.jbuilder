json.extract! review_song, :id, :user_id, :song_id, :review, :created_at, :updated_at
json.url review_song_url(review_song, format: :json)
