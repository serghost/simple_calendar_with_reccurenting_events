class Fix2DateColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :start_date, :date
    change_column :events, :date, :datetime
    remove_column :events, :start_time, :datetime
  end
end
