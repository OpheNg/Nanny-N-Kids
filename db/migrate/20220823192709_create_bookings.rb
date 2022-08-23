class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.references :user, null: false, foreign_key: true
      t.references :nanny, null: false, foreign_key: true
      t.date :end_date
      t.string :status
      t.float :total_price

      t.timestamps
    end
  end
end
