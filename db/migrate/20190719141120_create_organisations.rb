class CreateOrganisations < ActiveRecord::Migration[5.2]
  def change
    create_table :organisations do |t|

      t.string :name, null: false
      t.string :hourly_rate, null: false
      t.timestamps
    end
  end
end
