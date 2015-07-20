class CreateCronologies < ActiveRecord::Migration
  def change
    create_table :cronologies do |t|
      t.string :event
      t.datetime :date
      t.string :descripton
      t.string :url
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
