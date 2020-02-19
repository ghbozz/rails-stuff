class Stuff < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :photo, presence: true

  AVAILABILITIES = %w(monday tuesday wednesday thursday friday saturday sunday)
end
