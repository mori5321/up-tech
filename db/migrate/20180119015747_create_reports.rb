class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :task, null: false, foreign_key: true, index: true
      t.datetime :start_datetime, null: false
      t.datetime :finish_datetime, null: false
      t.timestamps
    end
  end
end
