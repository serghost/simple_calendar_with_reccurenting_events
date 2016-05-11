class AddRepeats < ActiveRecord::Migration
  def change
    create_table :repeats do |t|
      t.belongs_to :event, index: true
      t.string :title
      t.datetime :date
      t.string :tag
      t.timestamps null: false
    end
  end
end
