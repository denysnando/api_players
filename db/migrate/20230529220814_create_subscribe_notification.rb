class CreateSubscribeNotification < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribe_notifications do |t|
      t.references :player, foreign_key: true
      t.string :email, null: false

      t.timestamps
      t.index [:player_id, :email], unique: true
    end
  end
end
