class Performance < ApplicationRecord
  belongs_to :show
  has_many :artist_performances
  has_many :artists, through: :artist_performances
end
