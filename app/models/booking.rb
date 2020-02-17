class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :stuff

  validates :day, presence: true
  validate :days_inclusion

  private

  def days_inclusion
    if !self.stuff.availabilities.include?(self.day)
      errors.add(:day, "Day should be include in availabilities")
    end
  end
end
