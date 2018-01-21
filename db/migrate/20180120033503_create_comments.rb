class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :report, index: true, foreign_key: true, null: false
      t.text :text
      t.timestamps null: false
    end
  end
end
