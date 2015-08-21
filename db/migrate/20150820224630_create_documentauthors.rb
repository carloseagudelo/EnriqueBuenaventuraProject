class CreateDocumentauthors < ActiveRecord::Migration
  def change
    create_table :documentauthors do |t|
      t.integer :document_id, :nulll => false
      t.integer :author_id, :nulll => false

      t.timestamps null: false
    end
  end
end
