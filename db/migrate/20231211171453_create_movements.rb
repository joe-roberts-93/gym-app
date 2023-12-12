class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.boolean :legs, default: false
      t.boolean :chest, default: false
      t.boolean :core, default: false
      t.boolean :back, default: false
      t.boolean :arms, default: false
      t.timestamps
    end
  end
end
