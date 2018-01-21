class CreateStamps < ActiveRecord::Migration[5.1]
  def change
    create_table :stamps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :report_id, null: false, index: true, foreign_key: true
      t.integer :kind
      t.timestamps
    end
  end
end
