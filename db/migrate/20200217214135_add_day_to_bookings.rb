class AddDayToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :day, :datetime
  end
end
