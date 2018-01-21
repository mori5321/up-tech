class CreateStamps < ActiveRecord::Migration[5.1]
  def change
    create_table :stamps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true, index: true
      t.integer :kind
      t.timestamps
    end
  end
end
