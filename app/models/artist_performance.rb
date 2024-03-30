class ArtistPerformance < ApplicationRecord
  belongs_to :artist
  belongs_to :performance
end
