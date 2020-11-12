class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,                   null: false
      t.integer :shipped_prefecture_id,        null: false
      t.string :town,                          null: false
      t.string :town_number,                   null: false
      t.string :building
      t.string :phone_number,                  null: false
      t.references :order,                     ull: false, foreign_key: true
      t.timestamps
    end
  end
end
