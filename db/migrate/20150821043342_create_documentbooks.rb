class CreateDocumentbooks < ActiveRecord::Migration
  def change
    create_table :documentbooks do |t|
      t.integer :document_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
