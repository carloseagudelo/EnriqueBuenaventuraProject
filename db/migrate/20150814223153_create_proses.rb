class CreateProses < ActiveRecord::Migration
  def change
    create_table :proses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
