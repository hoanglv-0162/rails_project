class Song < ApplicationRecord
    has_one_attached :mp3
    belongs_to :user
    has_many :review_song, -> { order "created_at DESC"}
end
