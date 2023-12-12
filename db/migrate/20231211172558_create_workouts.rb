class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.text :notes
      t.date :date
      t.time :time
      t.references :user, null: false, foreign_key: true
      t.references :gym, null: false, foreign_key: true
      t.timestamps
    end
  end
end
