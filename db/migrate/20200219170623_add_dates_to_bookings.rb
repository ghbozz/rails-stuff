class AddDatesToBookings < ActiveRecord::Migration[6.0]
  def change
  	remove_column :bookings, :day
  	add_column :bookings, :start_date, :datetime
  	add_column :bookings, :end_date, :datetime
  end
end
