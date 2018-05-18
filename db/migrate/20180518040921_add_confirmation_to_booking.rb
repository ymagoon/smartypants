class AddConfirmationToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :confirmation, :string
  end
end
