class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :description
      t.datetime :date
      t.string :autor
      t.string :attachment

      t.timestamps null: false
    end

    create_table :authors, id: false do |t|
      t.belongs_to :document, index: true
      t.belongs_to :authors_worked, index: true 
    end

    create_table :books, id: false do |t|
      t.belongs_to :document, index: true
      t.belongs_to :books_worked, index: true 
    end

   create_table :documentPerArticle, id: false do |t|
      t.belongs_to :document, index: true
      t.belongs_to :article, index: true 
    end   

  end
end
