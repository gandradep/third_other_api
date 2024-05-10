class Artist < ApplicationRecord
  has_many :artist_performances
  has_many :performances, through: :artist_performances
end
