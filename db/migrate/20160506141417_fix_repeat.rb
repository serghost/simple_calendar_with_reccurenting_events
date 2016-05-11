class FixRepeat < ActiveRecord::Migration
  def change
    rename_column :repeats, :object, :title
    add_column :repeats, :date, :date
    add_column :repeats, :tag, :string
  end
end
