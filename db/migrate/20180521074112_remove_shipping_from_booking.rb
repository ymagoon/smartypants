class RemoveShippingFromBooking < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :shipping_address
  end
end
