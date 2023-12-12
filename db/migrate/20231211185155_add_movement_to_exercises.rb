class AddMovementToExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :movement, null: false, foreign_key: true
  end
end
