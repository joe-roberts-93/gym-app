class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.boolean :legs
      t.boolean :chest
      t.boolean :core
      t.boolean :back
      t.boolean :arms

      t.timestamps
    end
  end
end
