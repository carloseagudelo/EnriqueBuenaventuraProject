class CreateBooksWorkeds < ActiveRecord::Migration
  def change
    create_table :books_workeds do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
