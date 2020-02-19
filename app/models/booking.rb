class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :stuff

  validate :availability_check

  def availability_check
    self.stuff.bookings.map { |b| [b.start_date, b.end_date] }.each do |range|
      if self.start_date.between?(range[0], range[1]) || self.end_date.between?(range[0], range[1])
        errors.add(:start_date, "Already Booked ! Sorry :(")
      end 

      if (self.start_date..self.end_date).cover?(range[0]) || (self.start_date..self.end_date).cover?(range[1])
        errors.add(:start_date, "Already Booked ! Sorry :(")
      end
    end
  end

  private

  # def days_inclusion
  #   if self.day && !self.stuff.availabilities.include?(self.day.strftime("%A").downcase)
  #     errors.add(:day, "Day should be include in availabilities")
  #   end
  # end

end
