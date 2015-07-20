class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.datetime :date
      t.string :decription

      t.timestamps null: false
    end
  end
end
