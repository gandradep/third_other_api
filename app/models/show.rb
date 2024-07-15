class Show < ApplicationRecord
  belongs_to :venue
  has_many :performances
  accepts_nested_attributes_for :venue
end
