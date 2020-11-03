class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
    ## Database authenticatable
      t.string :email,              null: false
      t.string :encrypted_password, null: false
      t.string :title,              null: false
      t.text :description,          null: false
      t.references :user,           null: false, foreign_key: true
      t.integer :price,             null: false
      t.integer :category_id,       null: false
      t.integer :item_condition_id, null: false
      t.integer :shipping_fee_id,   null:false
      t.integer :shipped_prefecture_id, null:false
      t.integer :shipping_date_id,  null: false
 
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
 
      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps
    end
 
    # add_index :items, :email,                unique: true
    # add_index :items, :reset_password_token, unique: true
  end
end
