class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.integer :kind, null: false, default: 0
      t.datetime :start_datetime, null: false
      t.datetime :finish_datetime, null: false
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
