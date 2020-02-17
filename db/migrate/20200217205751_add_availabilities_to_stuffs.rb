class AddAvailabilitiesToStuffs < ActiveRecord::Migration[6.0]
  def change
    add_column :stuffs, :availabilities, :string, array: true, default: []
  end
end
