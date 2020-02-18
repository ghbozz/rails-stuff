class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :stuff

  validates :day, presence: true
  validate :days_inclusion

  private

  def days_inclusion
    if self.day && !self.stuff.availabilities.include?(self.day.strftime("%A").downcase)
      errors.add(:day, "Day should be include in availabilities")
    end
  end
  
end
