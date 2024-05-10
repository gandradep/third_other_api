class Show < ApplicationRecord
  belongs_to :venue
  has_many :performances
end
