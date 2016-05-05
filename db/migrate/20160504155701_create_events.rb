class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :calendar, index: true
      t.belongs_to :user, index: true
      t.string :title
      t.string :date
      t.string :repeat

      t.timestamps null: false
    end
  end
end
