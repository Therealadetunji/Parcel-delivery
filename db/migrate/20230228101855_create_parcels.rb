class CreateParcels < ActiveRecord::Migration[7.0]
  def change
    create_table :parcels do |t|
      t.string :name
      t.references :recipient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
