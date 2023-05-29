class CreateNotification < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :player, foreign_key: true
      t.string :message, null: false

      t.timestamps
      t.index [:player_id, :message], unique: true
    end
  end
end
