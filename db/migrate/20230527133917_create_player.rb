class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :nationality, null: false
      t.string :position, null: false
      t.integer :number
      t.integer :age

      t.timestamps
    end

    add_index :players, :name
    add_index :players, :position
    add_index :players, :nationality
  end
end
