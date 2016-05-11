class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.datetime :date
      t.string :repeat
      t.string :tag
      t.timestamps null: false
    end
  end
end
