class CreateNannies < ActiveRecord::Migration[6.1]
  def change
    create_table :nannies do |t|
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :tel
      t.string :email
      t.string :description
      t.integer :experience
      t.integer :capacity
      t.date :birthday
      t.string :kids_category
      t.string :sex
      t.boolean :at_user_place
      t.boolean :at_your_place
      t.integer :price_per_day

      t.timestamps
    end
  end
end
