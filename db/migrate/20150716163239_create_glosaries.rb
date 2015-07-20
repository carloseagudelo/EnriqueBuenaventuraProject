class CreateGlosaries < ActiveRecord::Migration
  def change
    create_table :glosaries do |t|
      t.string :word
      t.string :description

      t.timestamps null: false
    end
  end
end
