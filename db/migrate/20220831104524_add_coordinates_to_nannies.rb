class AddCoordinatesToNannies < ActiveRecord::Migration[6.1]
  def change
    add_column :nannies, :latitude, :float
    add_column :nannies, :longitude, :float
  end
end
