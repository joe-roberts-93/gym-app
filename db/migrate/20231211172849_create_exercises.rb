class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.float :weight
      t.integer :reps
      t.integer :sets
      t.references :exerciseable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
