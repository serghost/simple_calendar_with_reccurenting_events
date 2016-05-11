class Fix2DateColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :start_date, :date
    remove_column :events, :start_time, :datetime
    execute <<-SQL
      ALTER TABLE "events" ALTER COLUMN "date" TYPE timestamp
      USING ('2000-1-1'::date + date)
    SQL
  end
end
