class Song < ApplicationRecord
    has_one_attached :mp3
    has_many :review_song, -> { order "created_at DESC"}
end
