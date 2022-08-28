class AddUserToNannies < ActiveRecord::Migration[6.1]
  #alors pas du tout sûr du null: true, mais j'étais bloqué sans
  def change
    add_reference :nannies, :user, null: false, foreign_key: true
  end
end
