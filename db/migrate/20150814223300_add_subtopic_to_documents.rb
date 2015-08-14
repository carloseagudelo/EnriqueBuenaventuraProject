class AddSubtopicToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :subtopic, index: true, foreign_key: true
  end
end
