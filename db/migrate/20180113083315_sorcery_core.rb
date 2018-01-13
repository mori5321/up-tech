class SorceryCore < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :crypted_password, null: false
      t.string :salt, null: false
      t.integer :role, null: false, default: 0
      t.integer :superior_id, index: true, foreign_key: true
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
