class CreateRepeats < ActiveRecord::Migration
  def change
    create_table :repeats do |t|
      t.string :object
      t.belongs_to :event, index: true
      t.timestamps null: false
    end
  end
end
