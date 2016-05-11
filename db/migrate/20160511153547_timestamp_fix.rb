class TimestampFix < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE "events" ALTER COLUMN "date" TYPE timestamp
    SQL
  end

  def down
  end
end
