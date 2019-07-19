class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|

      t.integer :user_id, null: false
      t.datetime :start, null: false
      t.datetime :finish, null: false
      t.string :break_length, null: false
      t.timestamps
    end
  end
end
