class CreateDesafios < ActiveRecord::Migration[5.2]
  def change
    create_table :desafios do |t|
      t.string :event
      t.timestamp :timestamp

      t.timestamps
    end
  end
end
