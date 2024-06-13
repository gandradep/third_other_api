class Venue < ApplicationRecord
  has_many :shows

  validates :name, presence: true
  validates :url_location, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
