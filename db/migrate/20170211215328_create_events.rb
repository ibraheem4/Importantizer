class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :user_id, null: false
      t.string :token, null: false

      t.timestamps
    end
  end
end
