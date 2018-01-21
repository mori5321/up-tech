class AddCheckedToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :checked, :boolean, default: false, null: false
  end
end
