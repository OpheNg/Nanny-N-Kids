class AddUserToNannies < ActiveRecord::Migration[6.1]
  def change
    add_reference :nannies, :user, null: true, foreign_key: true
  end
end
